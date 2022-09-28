import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/first_time_login_controller.dart';
import 'package:jpj_info/controller/forgot_password_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/controller/new_user_check_id.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/model/login_request.dart';
import 'package:jpj_info/model/login_response.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:jpj_info/view/login/login.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends StatefulWidget {
  const LoginController({
    Key? key,
    this.username,
    this.password,
  }) : super(key: key);
  final String? username;
  final String? password;

  @override
  State<StatefulWidget> createState() => _LoginController();
}

class _LoginController extends State<LoginController> {
  late TextEditingController _userId;
  late TextEditingController _userPwd;
  bool bypass = false; //todo: remove this when login is ok

  @override
  void initState() {
    super.initState();
    _userId = TextEditingController();
    _userPwd = TextEditingController();
    if (widget.username != null) {
      _userId.text = widget.username!;
    }
    if (widget.password != null) {
      _userPwd.text = widget.password!;
    }
  }

  @override
  void dispose() {
    _userId.dispose();
    _userPwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _afterBuild();
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          hasBackButton: false,
          decor: customGradient,
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

  void _afterBuild() {
    if (widget.password != null && widget.username != null) {
      login(context);
    }
  }

  void _responseHandler(http.Response response) {
    if (response.statusCode == 200 || bypass) {
      LoginResponse loginResponse;
      loginResponse = LoginResponse.fromJson(
        jsonDecode(response.body),
      );
      if (loginResponse.idmpuStatus != null) {
        if (loginResponse.idmpuStatus == "F " ||
            loginResponse.idmpuStatus == "A ") {
          loginResponse.idmpuUserEmail =
              loginResponse.idmpuUserEmail!.replaceAll(" ", "");
          SharedPreferences.getInstance().then((pref) {
            pref.setString(
              LocalStorageHelper().userLoginInfo,
              response.body,
            );
          });
          MyJPJAccountManager().init().then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  if (loginResponse.idmpuStatus == "F ") {
                    return const FirstTimeLoginController();
                  } else {
                    return const MainpageController();
                  }
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
      if (_userId.text == '1' && _userPwd.text == "1") {
        //todo: for mock only, tobe removed
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const FirstTimeLoginController();
            },
          ),
        );
      } else if (bypass) {
        http.Response a = http.Response("", 200);
        _responseHandler(a);
      } else {
        SiteConfig conf = SiteConfig();
        LoginRequest req = LoginRequest(
          username: _userId.text,
          katalaluan: _userPwd.text,
        );
        jpjHttpRequest(
          context,
          Uri.parse(conf.loginUri),
          headers: conf.formHeader,
          body: jsonEncode(req.toJson()),
          callback: _responseHandler,
        );
      }
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
          return const NewUserCheckIdController();
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
