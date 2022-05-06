import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/login_controller.dart';
import 'package:jpj_info/model/new_registration_request.dart';
import 'package:jpj_info/model/new_registration_response.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/newRegistration/new_registration.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class NewRegistrationController extends StatefulWidget {
  const NewRegistrationController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewRegistrationController();
}

class _NewRegistrationController extends State<NewRegistrationController> {
  late TextEditingController _email;
  late TextEditingController _emailVerification;
  late TextEditingController _phone;
  late TextEditingController _id;
  bool _agreeToTnc = false;
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _emailVerification = TextEditingController();
    _phone = TextEditingController();
    _id = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _emailVerification.dispose();
    _phone.dispose();
    _id.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  Future<void> _submitCallback(BuildContext context) async {
    if (_agreeToTnc &&
        _email.text != "" &&
        _id.text != "" &&
        _phone.text != "" &&
        _emailVerification.text != "" &&
        _email.text == _emailVerification.text) {
      SiteConfig conf = SiteConfig();
      RegistrationRequest req = RegistrationRequest(
        email: _email.text,
        idNumber: _id.text,
        phone: _phone.text,
      );
      try {
        EasyLoading.show(
          status: AppLocalizations.of(context)!.pleaseWait,
        );
        final response = await http.post(
          Uri.parse(conf.registrationUri),
          headers: conf.jsonHeader,
          body: jsonEncode(req.toJson()),
        );
        if (response.statusCode == 200) {
          RegistrationResponse respond = RegistrationResponse.fromJson(
            jsonDecode(response.body),
          );
          if (respond.status == '0') {
            TooltipInfo().showInfo(
              context,
              AppLocalizations.of(context)!.tempPasswordSent,
              AppLocalizations.of(context)!.checkEmail,
              (c) => _onCloseSubmitInfo(c),
            );
          } else if (respond.status == '1') {
            TooltipInfo().showInfo(
              context,
              AppLocalizations.of(context)!.failedToRegister,
              AppLocalizations.of(context)!.userExist,
              (c) {},
            );
          } else if (respond.status == '2') {
            TooltipInfo().showInfo(
              context,
              AppLocalizations.of(context)!.failedToRegister,
              AppLocalizations.of(context)!.userBlocked,
              (c) {},
            );
          } else {
            TooltipInfo().showInfo(
              context,
              AppLocalizations.of(context)!.failedToRegister,
              AppLocalizations.of(context)!.errorPleaseTryAgain,
              (c) {},
            );
          }
        } else {
          AlertController(ctx: context).connectionError();
        }
      } catch (e) {
        AlertController(ctx: context).connectionError();
      } finally {
        EasyLoading.dismiss();
      }
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

  void _onCloseSubmitInfo(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginController();
        },
      ),
    );
  }

  void _onCheckboxChanged(bool? checked) {
    _agreeToTnc = checked!;
  }

  void _moreTnc() {
    TooltipInfo().showInfo(
      context,
      "",
      AppLocalizations.of(context)!.tncLong,
      (c) => {},
    );
  }
}
