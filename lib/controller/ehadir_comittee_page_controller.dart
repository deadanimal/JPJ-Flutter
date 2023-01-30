import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/controller/menu_action.dart';
import 'package:jpj_info/controller/prompt_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/ehadir/activity_list_req.dart';
import 'package:jpj_info/model/ehadir/activity_list_res.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/eHadirComitteePage/ehadir_comittee_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class EhadirComitteePageController extends StatefulWidget {
  const EhadirComitteePageController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EhadirComitteePageController();
}

class _EhadirComitteePageController
    extends State<EhadirComitteePageController> {
  late List<Aktiviti> events;
  @override
  void initState() {
    super.initState();
    events = [];
    Future.delayed(
      const Duration(milliseconds: 250),
      _checkForActivity,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: EhadirComitteePage(
          refreshCallback: _checkForActivity,
          viewActivityCallback: _viewActivityDetails,
          eraseActivityCallback: _erasectivity,
          events: events,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ehadirAddActivityPage(context);
          },
          backgroundColor: const Color(themeNavy),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: const BottomNavController(),
      ),
    );
  }

  void _refreshMsgList(http.Response response) {
    if (response.statusCode == 200) {
      ActivityListRes res = ActivityListRes.fromJson(
        jsonDecode(response.body),
      );
      setState(() {
        events.clear();
        if (res.aktiviti != null) {
          events = res.aktiviti!;
        }
      });
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  void _checkForActivity() async {
    SiteConfig conf = SiteConfig();
    ActivityListReq req = ActivityListReq(
      nokp: MyJPJAccountManager().id,
    );

    return jpjHttpRequest(
      context,
      Uri.parse(conf.eHadirActivityList),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: _refreshMsgList,
    );
  }

  void _viewActivityDetails(BuildContext context, Aktiviti event) {
    eHadirActivityInfoPage(context, event);
  }

  void _erasectivity(BuildContext context, Aktiviti event) {
    PromptController(ctx: context).prompt(
      "${AppLocalizations.of(context)!.erase} ${AppLocalizations.of(context)!.event}?",
      () {
        _confirmErase(event);
        Navigator.of(context).pop();
      },
      () {
        Navigator.of(context).pop();
      },
    );
  }

  void _confirmErase(Aktiviti event) {
    SiteConfig conf = SiteConfig();
    jpjHttpDeleteRequest(
      context,
      Uri.parse(conf.eHadirRemoveComittee + event.id.toString()),
      headers: conf.formHeader,
      callback: (res) {
        setState(() {
          // events.remove(event);
          _checkForActivity();
        });
      },
    );
  }
}
