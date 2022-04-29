import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/menu_action.dart';
import 'package:jpj_info/controller/prompt_controller.dart';
import 'package:jpj_info/model/ehadir_event_info.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/eHadirComitteePage/ehadir_comittee_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EhadirComitteePageController extends StatefulWidget {
  const EhadirComitteePageController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EhadirComitteePageController();
}

class _EhadirComitteePageController
    extends State<EhadirComitteePageController> {
  late List<EHadirEventInfo> events;
  @override
  void initState() {
    super.initState();
    events = [];
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
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: EhadirComitteePage(
          refreshCallback: _refreshMsgList,
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
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _refreshMsgList() async {
    final String response =
        await rootBundle.loadString('json/ehadir_activity_list.json');
    final data = await json.decode(response);
    setState(() {
      // events.clear();
      for (var item in data) {
        events.add(
          EHadirEventInfo.fromJson(item),
        );
      }
    });
  }

  void _viewActivityDetails(BuildContext context, EHadirEventInfo event) {
    eHadirActivityInfoPage(context, event);
  }

  void _erasectivity(BuildContext context, EHadirEventInfo event) {
    PromptController(ctx: context).prompt(
      AppLocalizations.of(context)!.erase +
          " " +
          AppLocalizations.of(context)!.event +
          "?",
      () {
        _confirmErase(event);
        Navigator.of(context).pop();
      },
      () {
        Navigator.of(context).pop();
      },
    );
  }

  void _confirmErase(EHadirEventInfo event) {
    setState(() {
      events.remove(event);
    });
  }
}
