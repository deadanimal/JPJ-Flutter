import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/change_temp_password_request.dart';
import 'package:jpj_info/model/change_temp_password_response.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/firstTimePasswordChange/first_time_password_change.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:http/http.dart' as http;

class FirstTimePasswordChangeController extends StatefulWidget {
  const FirstTimePasswordChangeController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FirstTimePasswordChangeController();
}

class _FirstTimePasswordChangeController
    extends State<FirstTimePasswordChangeController> {
  late TextEditingController _controller;
  late TextEditingController _confirmController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: FirstTimePasswordChange(
          passwordController: _controller,
          pwdConfirmController: _confirmController,
          submitCB: _submitCallback,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _responseHandler(http.Response response) {
    if (response.statusCode == 200) {
      ChangeTempPasswordResponse res = ChangeTempPasswordResponse.fromJson(
        jsonDecode(response.body),
      );
      if (res.status != null && res.status == "00") {
        TooltipInfo().showInfo(
          context,
          AppLocalizations.of(context)!.successfullySaved,
          AppLocalizations.of(context)!.pleaseLogin,
          (c) {
            MyJPJAccountManager().logOut(context);
          },
        );
      } else {
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
            Navigator.pop(context);
          },
        );
      }
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  Future<void> _submitCallback(BuildContext context) async {
    if (_confirmController.text == _controller.text) {
      SiteConfig conf = SiteConfig();
      ChangeTempPasswordRequest req = ChangeTempPasswordRequest(
        katalaluanBaru: _controller.text,
        nokp: MyJPJAccountManager().id,
      );
      jpjHttpRequest(
        context,
        Uri.parse(conf.changePasswordUri),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
        callback: _responseHandler,
      );
    } else {
      TooltipInfo().showInfo(
        context,
        AppLocalizations.of(context)!.errorPleaseTryAgain,
        AppLocalizations.of(context)!.enteredPasswordNotTheSame,
        (c) {},
      );
    }
  }
}
