import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/ehadir_event_info.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/eHadirActivityDetail/ehadir_event_details.dart';
import 'package:jpj_info/view/eHadirActivityList/ehadir_activity_list.dart';

class EhadirActivityListController extends StatefulWidget {
  const EhadirActivityListController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EhadirActivityListController();
}

class _EhadirActivityListController
    extends State<EhadirActivityListController> {
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
          decor: customGradient,
        ),
        body: EhadirActivityList(
          refreshCallback: _refreshMsgList,
          viewActivityCallback: _viewActivityDetails,
          events: events,
        ),
        bottomNavigationBar: const BottomNavController(),
      ),
    );
  }

  void _refreshMsgList() async {
    final String response =
        await rootBundle.loadString('json/ehadir_activity_list.json');
    final data = await json.decode(response);
    setState(() {
      events.clear();
      for (var item in data) {
        events.add(
          EHadirEventInfo.fromJson(item),
        );
      }
    });
  }

  void _viewActivityDetails(BuildContext context, EHadirEventInfo event) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EhadirActivityDetails(
            event: event,
          );
        },
      ),
    );
  }
}
