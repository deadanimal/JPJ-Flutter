import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/controller/login_controller.dart';
import 'package:jpj_info/controller/new_registration_controller.dart';
import 'package:jpj_info/model/check_id_request.dart';
import 'package:jpj_info/model/check_id_response.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:jpj_info/view/newRegistration/check_id.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class NewUserCheckIdController extends StatefulWidget {
  const NewUserCheckIdController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewUserCheckIdController();
}

class _NewUserCheckIdController extends State<NewUserCheckIdController> {
  late TextEditingController _id;
  @override
  void initState() {
    super.initState();
    _id = TextEditingController();
  }

  @override
  void dispose() {
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
        body: CheckId(
          submitCB: _submitCallback,
          idController: _id,
        ),
      ),
    );
  }

  Future<void> _submitCallback(BuildContext context) async {
    if (_id.text.isNotEmpty) {
      SiteConfig conf = SiteConfig();
      CheckIdRequest req = CheckIdRequest(nokp: _id.text);
      String uri =
          _id.text == "1" ? conf.checkUserIdUrierr : conf.checkUserIdUri;
      jpjHttpRequest(
        context,
        Uri.parse(uri),
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

  void _responseHandler(http.Response response) {
    if (response.statusCode == 200) {
      CheckIdResponse checkIdResponse;
      checkIdResponse = CheckIdResponse.fromJson(
        jsonDecode(response.body),
      );
      if (checkIdResponse.status != null) {
        if (checkIdResponse.status == "01") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return NewRegistrationController(
                  userData: checkIdResponse,
                );
              },
            ),
          );
        } else if (checkIdResponse.status == "55") {
          AlertController(ctx: context).generalError(
            AppLocalizations.of(context)!.noRecordInMySikap,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginController();
                  },
                ),
              );
            },
          );
        } else {
          AlertController(ctx: context).generalError(
            AppLocalizations.of(context)!.alreadyRegistered,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginController();
                  },
                ),
              );
            },
          );
        }
      } else {
        AlertController(ctx: context).generalError(
          AppLocalizations.of(context)!.failedToRegister,
          () {
            Navigator.pop(context);
          },
        );
      }
    } else {
      AlertController(ctx: context).connectionError();
    }
  }
}
