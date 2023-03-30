import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/string_helper.dart';
import 'package:jpj_info/model/ehadir/add_comittee_req.dart';
import 'package:jpj_info/model/ehadir/add_comittee_res.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/eHadirAddComittee/ehadir_add_comittee.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EhadirAddComitteeController extends StatefulWidget {
  const EhadirAddComitteeController({
    Key? key,
    required this.activityId,
    required this.transidAktiviti,
  }) : super(key: key);

  final int activityId;
  final String transidAktiviti;

  @override
  State<StatefulWidget> createState() => _EhadirAddComitteeController();
}

class _EhadirAddComitteeController extends State<EhadirAddComitteeController> {
  late TextEditingController staffNric;

  @override
  void initState() {
    super.initState();
    staffNric = TextEditingController();
  }

  @override
  void dispose() {
    staffNric.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: EhadirAddComitee(
          submitCallback: _submitCallback,
          staffNricController: staffNric,
        ),
        bottomNavigationBar: const BottomNavController(),
      ),
    );
  }

  void _submitCallback(BuildContext context) {
    SiteConfig conf = SiteConfig();
    AddComitteeReq req = AddComitteeReq(
      idAktiviti: widget.activityId,
      nokp: staffNric.text,
      transidAktiviti: widget.transidAktiviti,
    );
    return jpjHttpRequest(
      context,
      Uri.parse(conf.eHadirAddComittee),
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
}
