import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/ehadir/activity_list_res.dart';
import 'package:jpj_info/model/ehadir/add_comittee_res.dart';
import 'package:jpj_info/model/ehadir/manual_register_req.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/eHadirManualRegister/ehadir_manual_register.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/helper/string_helper.dart';

class EhadirManualRegistrationController extends StatefulWidget {
  const EhadirManualRegistrationController({
    Key? key,
    required this.activityId,
    required this.transidAktiviti,
    required this.transidSesi,
  }) : super(key: key);
  final int activityId;
  final String transidAktiviti;
  final String transidSesi;

  @override
  State<StatefulWidget> createState() => _EhadirManualRegistrationController();
}

class _EhadirManualRegistrationController
    extends State<EhadirManualRegistrationController> {
  late TextEditingController staffNric;
  late Aktiviti activityInfo;

  @override
  void initState() {
    super.initState();
    staffNric = TextEditingController();
    activityInfo = Aktiviti();
    Future.delayed(
      const Duration(milliseconds: 250),
      _getActivity,
    );
  }

  @override
  void dispose() {
    super.dispose();
    staffNric.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: EhadirManualRegistration(
          submitCallback: _submitCallback,
          staffNricController: staffNric,
        ),
        bottomNavigationBar: const BottomNavController(),
      ),
    );
  }

  void _submitCallback(BuildContext context) {
    // todo: add processing of input to update comittee list
    SiteConfig conf = SiteConfig();
    ManualRegisterReq req = ManualRegisterReq(
      idAktiviti: widget.activityId,
      nokp: staffNric.text,
      transidAktiviti: widget.transidAktiviti,
      transidSesi: widget.transidSesi,
      userId: MyJPJAccountManager().id,
      // jenis: activityInfo
    );
    return jpjHttpRequest(
      context,
      Uri.parse(conf.eHadirManualRegister),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: (res) {
        if (res.statusCode == 200) {
          AddComitteeRes response =
              AddComitteeRes.fromJson(jsonDecode(res.body));
          if (response.kod == 0) {
            AlertController(ctx: context).generalError(
                capitalize(
                  AppLocalizations.of(context)!.successfullySaved,
                ), () {
              Navigator.pop(context);
              Navigator.pop(context);
            });
          } else {
            List<String> errString = response.message!.split("|");
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
                Navigator.pop(context);
                Navigator.pop(context);
              },
            );
          }
        } else {
          AlertController(ctx: context).generalError(
            AppLocalizations.of(context)!.errorPleaseTryAgain,
            () {
              Navigator.pop(context);
            },
          );
        }
      },
    );
  }

  void _getActivity() {
    SiteConfig conf = SiteConfig();

    jpjHttpRequest(
      context,
      Uri.parse(conf.eHadirActivityById),
      headers: conf.formHeader,
      body: jsonEncode({
        'id': widget.activityId.toString(),
      }),
      callback: (res) {
        if (res.statusCode == 200) {
          ActivityListRes response =
              ActivityListRes.fromJson(jsonDecode(res.body));
          activityInfo = response.aktiviti![0];
          setState(() {
            activityInfo = response.aktiviti![0];
          });
        }
      },
    );
  }
}
