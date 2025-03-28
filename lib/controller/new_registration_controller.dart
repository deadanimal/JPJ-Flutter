import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/controller/login_controller.dart';
import 'package:jpj_info/helper/id_types.dart';
import 'package:jpj_info/model/check_id_response.dart';
import 'package:jpj_info/model/new_user_registration_request.dart';
import 'package:jpj_info/model/new_user_registration_response.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/newRegistration/new_registration.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class NewRegistrationController extends StatefulWidget {
  const NewRegistrationController({Key? key, this.userData}) : super(key: key);
  final CheckIdResponse? userData;

  @override
  State<StatefulWidget> createState() => _NewRegistrationController();
}

class _NewRegistrationController extends State<NewRegistrationController> {
  late TextEditingController _email;
  late TextEditingController _emailVerification;
  late TextEditingController _phone;
  late TextEditingController _id;
  late TextEditingController _name;
  late List<String> dropdownList;
  late String dropdownValue;

  bool _agreeToTnc = false;
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _emailVerification = TextEditingController();
    _phone = TextEditingController();
    _id = TextEditingController();
    _name = TextEditingController();
    if (widget.userData != null) {
      _email.text = widget.userData?.email ?? "";
      _emailVerification.text = widget.userData?.email ?? "";
      _phone.text = widget.userData?.phone ?? "";
      _id.text = widget.userData?.nokp ?? "";
      _name.text = widget.userData?.name ?? "";

      _email.text = _email.text.trim();
      _emailVerification.text = _emailVerification.text.trim();
      _phone.text = _phone.text.trim();
      _id.text = _id.text.trim();
      _name.text = _name.text.trim();
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _emailVerification.dispose();
    _phone.dispose();
    _id.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dropdownList = getIdType(context);
    dropdownValue = AppLocalizations.of(context)!.malaysian;
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: NewRegistration(
          readTnc: _moreTnc,
          submitCB: _submitCallback,
          tncCheckedCB: _onCheckboxChanged,
          emailController: _email,
          emailVerifyController: _emailVerification,
          idController: _id,
          phoneController: _phone,
          nameController: _name,
          dropdownList: dropdownList,
          dropdownValue: dropdownValue,
          selectionCallback: _setSelection,
        ),
      ),
    );
  }

  void _responseHandler(http.Response response) {
    if (response.statusCode == 200) {
      NewUserRegistrationResponse res;
      res = NewUserRegistrationResponse.fromJson(
        jsonDecode(response.body),
      );
      if (res.statusCode != null) {
        if (res.statusCode == "00") {
          TooltipInfo().showInfo(
            context,
            AppLocalizations.of(context)!.successfullySaved,
            "",
            (c) => _onCloseSubmitInfo(c, res.tempPwd!),
          );
        } else if (res.statusMsg != null) {
          List<String> errString = res.statusMsg!.split("|");
          String err;
          if (errString.length == 1) {
            err = errString[0];
          } else if (AppLocalizations.of(context)!.localeName == "ms") {
            err = errString[0];
          } else {
            err = errString[1];
          }
          AlertController(ctx: context).generalError(
            err,
            () {
              Navigator.of(context).pop();
            },
          );
        }
      } else {
        AlertController(ctx: context).connectionError();
      }
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  Future<void> _submitCallback(BuildContext context) async {
    if (_agreeToTnc &&
        _email.text != "" &&
        _id.text != "" &&
        _phone.text != "" &&
        _emailVerification.text != "" &&
        _name.text != "" &&
        _email.text == _emailVerification.text) {
      SiteConfig conf = SiteConfig();
      var index =
          dropdownList.indexWhere((element) => element == dropdownValue);
      NewUserRegistrationRequest req = NewUserRegistrationRequest(
        emel: _email.text,
        nokp: _id.text,
        telefon: _phone.text,
        kategori: index.toString(),
        nama: _name.text,
      );
      jpjHttpRequest(
        context,
        Uri.parse(conf.registrationUri),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
        callback: _responseHandler,
      );
    } else {
      if (_email.text != _emailVerification.text) {
        TooltipInfo().showInfo(
          context,
          AppLocalizations.of(context)!.failedToRegister,
          AppLocalizations.of(context)!.emailNotSame,
          (c) {},
        );
      } else if (!_agreeToTnc) {
        TooltipInfo().showInfo(
          context,
          AppLocalizations.of(context)!.failedToRegister,
          AppLocalizations.of(context)!.pleaseTickTnc,
          (c) {},
        );
      } else {
        TooltipInfo().showInfo(
          context,
          AppLocalizations.of(context)!.failedToRegister,
          AppLocalizations.of(context)!.pleaseFillAllInfo,
          (c) {},
        );
      }
    }
  }

  void _onCloseSubmitInfo(BuildContext context, String tempPassword) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginController(
            username: _id.text,
            password: tempPassword,
          );
        },
      ),
    );
  }

  void _onCheckboxChanged(bool? checked) {
    _agreeToTnc = checked!;
  }

  void _moreTnc() {
    AlertController(ctx: context).generalError(
      AppLocalizations.of(context)!.tncLong,
      () {
        Navigator.of(context).pop();
      },
    );
  }

  void _setSelection(String? newSelection) {
    setState(() {
      dropdownValue = newSelection!;
    });
  }
}
