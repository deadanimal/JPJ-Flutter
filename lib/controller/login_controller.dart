import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/forgot_password_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/controller/new_registration_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/model/login_request.dart';
import 'package:jpj_info/model/login_response.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:jpj_info/view/login/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends StatefulWidget {
  const LoginController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginController();
}

class _LoginController extends State<LoginController> {
  late TextEditingController _userId;
  late TextEditingController _userPwd;
  @override
  void initState() {
    super.initState();
    _userId = TextEditingController();
    _userPwd = TextEditingController();
  }

  @override
  void dispose() {
    _userId.dispose();
    _userPwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: Login(
          userId: _userId,
          userPwd: _userPwd,
          newAccountCB: newRegistration,
          logInCB: login,
          forgotPasswordCB: forgotPassword,
        ),
      ),
    );
  }

  void _responseHandler(http.Response response) {
    if (response.statusCode == 200) {
      LoginResponse loginResponse;
      loginResponse = LoginResponse.fromJson(
        jsonDecode(response.body),
      );
      if (loginResponse.status != null) {
        if (loginResponse.status == 0) {
          SharedPreferences.getInstance().then((pref) {
            pref.setString(
              LocalStorageHelper().userLoginInfo,
              response.body,
            );
          });
          MyJPJAccountManager().init().then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MainpageController();
                },
              ),
            );
          });
        } else {
          AlertController(ctx: context).generalError(
            AppLocalizations.of(context)!.failToLogin,
            () {
              Navigator.pop(context);
            },
          );
        }
      } else {
        AlertController(ctx: context).generalError(
          AppLocalizations.of(context)!.failToLogin,
          () {
            Navigator.pop(context);
          },
        );
      }
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  void login(BuildContext context) {
    if (_userId.text.isNotEmpty && _userPwd.text.isNotEmpty) {
      SiteConfig conf = SiteConfig();
      LoginRequest req = LoginRequest(
        username: _userId.text,
        katalaluan: _userPwd.text,
      );
      jpjHttpRequest(
        context,
        Uri.parse(conf.loginUri),
        headers: conf.jsonHeader,
        body: jsonEncode(req.toJson()),
        callback: _responseHandler,
      );
    } else {
      TooltipInfo().showInfo(
        context,
        AppLocalizations.of(context)!.failToLogin,
        AppLocalizations.of(context)!.pleaseFillAllInfo,
        (c) {},
      );
    }
  }

  bool isLoggedIn() {
    return false; // check for saved login detail
  }

  void newRegistration(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const NewRegistrationController();
        },
      ),
    );
  }

  void forgotPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ForgotPasswordController();
        },
      ),
    );
  }
}
