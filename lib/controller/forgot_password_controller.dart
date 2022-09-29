import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/controller/tac_controller.dart';
import 'package:jpj_info/model/reset_password_request.dart';
import 'package:jpj_info/model/reset_password_response.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/forgotPassword/forgot_password.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordController extends StatefulWidget {
  const ForgotPasswordController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgotPasswordController();
}

class _ForgotPasswordController extends State<ForgotPasswordController> {
  late TextEditingController _email;
  late TextEditingController _id;
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _id = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _id.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          darkBtn: true,
          iconColor: Color(themeNavy),
        ),
        body: ForgotPassword(
          emailController: _email,
          idController: _id,
          submitCB: submitCallback,
        ),
      ),
    );
  }

  void _responseHandler(http.Response response) {
    if (response.statusCode == 200) {
      ResetPasswordResponse res;
      res = ResetPasswordResponse.fromJson(
        jsonDecode(response.body),
      );
      if (res.status != null) {
        if (res.msg == "SUCCESS") {
          TooltipInfo().showInfo(
            context,
            AppLocalizations.of(context)!.tacSubmitted,
            AppLocalizations.of(context)!.checkEmail,
            (c) => _onCloseSubmitInfo(
              c,
              _id.text,
              res.tac!,
            ),
          );
        } else {
          TooltipInfo().showInfo(
            context,
            AppLocalizations.of(context)!.errorPleaseTryAgain,
            "",
            (c) => () {},
          );
        }
      } else {
        TooltipInfo().showInfo(
          context,
          AppLocalizations.of(context)!.errorPleaseTryAgain,
          "",
          (c) => () {},
        );
      }
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  Future<void> submitCallback(BuildContext context) async {
    if (_id.text.isNotEmpty && _email.text.isNotEmpty) {
      SiteConfig conf = SiteConfig();
      ResetPasswordRequest req = ResetPasswordRequest(
        emel: _email.text,
        nokp: _id.text,
      );
      jpjHttpRequest(
        context,
        Uri.parse(conf.resetPasswordUri),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
        callback: _responseHandler,
      );
    } else {
      TooltipInfo().showInfo(
        context,
        AppLocalizations.of(context)!.pleaseFillAllInfo,
        "",
        (c) {},
      );
    }
  }

  void _onCloseSubmitInfo(BuildContext context, String id, String tac) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TacController(
            id: id,
            tac: tac,
          );
        },
      ),
    );
  }
}
