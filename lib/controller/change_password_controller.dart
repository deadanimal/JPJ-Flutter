import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/change_temp_password_request.dart';
import 'package:jpj_info/model/change_temp_password_response.dart';
import 'package:jpj_info/model/login_request.dart';
import 'package:jpj_info/model/login_response.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/changePassword/change_password.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';

class ChangePasswordController extends StatefulWidget {
  const ChangePasswordController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangePasswordController();
}

class _ChangePasswordController extends State<ChangePasswordController> {
  late TextEditingController _oldPassword;
  late TextEditingController _password;
  late TextEditingController _passwordConfirm;
  @override
  void initState() {
    super.initState();
    _oldPassword = TextEditingController();
    _password = TextEditingController();
    _passwordConfirm = TextEditingController();
  }

  @override
  void dispose() {
    _oldPassword.dispose();
    _password.dispose();
    _passwordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: ChangePassword(
          oldpasswordController: _oldPassword,
          passwordController: _password,
          pwdConfirmController: _passwordConfirm,
          submitCB: submitCallback,
        ),
      ),
    );
  }

  void submitCallback(BuildContext context) {
    if (_oldPassword.text != "" && (_password.text == _passwordConfirm.text)) {
      SiteConfig conf = SiteConfig();
      LoginRequest req = LoginRequest(
        username: MyJPJAccountManager().id,
        katalaluan: _oldPassword.text,
      );
      jpjHttpRequest(
        context,
        Uri.parse(conf.loginUri),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
        callback: _loginResponseHandler,
      );
    } else if (_password.text != _passwordConfirm.text) {
      AlertController(ctx: context).generalError(
        AppLocalizations.of(context)!.enteredPasswordNotTheSame,
        () {
          Navigator.of(context).pop();
        },
      );
    } else {
      AlertController(ctx: context).generalError(
        AppLocalizations.of(context)!.pleaseFillAllInfo,
        () {
          Navigator.of(context).pop();
        },
      );
    }
  }

  void _loginResponseHandler(Response response) {
    if (response.statusCode == 200) {
      LoginResponse loginResponse;
      loginResponse = LoginResponse.fromJson(
        jsonDecode(response.body),
      );
      if (loginResponse.idmpuUsrId == MyJPJAccountManager().id) {
        _changePassword();
      } else {
        AlertController(ctx: context).generalError(
          AppLocalizations.of(context)!.wrongPassword,
          () {
            Navigator.of(context).pop();
          },
        );
      }
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  void _changePassword() {
    if (validateStructure(_passwordConfirm.text)) {
      SiteConfig conf = SiteConfig();
      ChangeTempPasswordRequest req = ChangeTempPasswordRequest(
        nokp: MyJPJAccountManager().id,
        katalaluanBaru: _passwordConfirm.text,
      );
      jpjHttpRequest(
        context,
        Uri.parse(conf.changePasswordUri),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
        callback: _changePasswordResponseHandler,
      );
    } else {
      TooltipInfo().showInfo(
        context,
        AppLocalizations.of(context)!.errorPleaseTryAgain,
        AppLocalizations.of(context)!.passwordNotComplient,
        (c) {},
      );
    }
  }

  void _changePasswordResponseHandler(Response response) {
    if (response.statusCode == 200) {
      ChangeTempPasswordResponse res = ChangeTempPasswordResponse.fromJson(
        jsonDecode(
          response.body,
        ),
      );
      if (res.status != null && res.status == "00") {
        _successCallback(context);
      } else if (res.msg != null) {
        List<String> errString = res.msg!.split("|");
        String err;
        if (AppLocalizations.of(context)!.localeName == "ms") {
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
      } else {
        AlertController(ctx: context).generalError(
          AppLocalizations.of(context)!.errorPleaseTryAgain,
          () {
            Navigator.of(context).pop();
          },
        );
      }
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  void _successCallback(BuildContext context) {
    AlertController(ctx: context).generalError(
      AppLocalizations.of(context)!.passwordChangeSuccess,
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const MainpageController();
            },
          ),
        );
      },
    );
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
