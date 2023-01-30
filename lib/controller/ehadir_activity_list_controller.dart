import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/ehadir/activity_list_req.dart';
import 'package:jpj_info/model/ehadir/activity_list_res.dart';
import 'package:jpj_info/model/ehadir/attending_activity_list_res.dart';
import 'package:jpj_info/model/ehadir_event_info.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/eHadirActivityDetail/ehadir_event_details.dart';
import 'package:jpj_info/view/eHadirActivityList/ehadir_activity_list.dart';
import 'package:http/http.dart' as http;

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
        body: EhadirActivityList(
          refreshCallback: _checkForActivity,
          viewActivityCallback: _viewActivityDetails,
          events: events,
        ),
        bottomNavigationBar: const BottomNavController(),
      ),
    );
  }

  void _refreshMsgList(http.Response response) {
    if (response.statusCode == 200) {
      List<AttendingActivityListRes> res = [];
      for (var el in jsonDecode(response.body)) {
        res.add(AttendingActivityListRes.fromJson(el));
      }
      setState(() {
        events.clear();
        for (var item in res) {
          events.add(
            EHadirEventInfo(
              date: item.tarikhMula,
              endTime: item.masaTamat,
              eventName: item.namaAktiviti,
              id: item.id,
              organizer: item.urusetiaId,
              startTime: item.masaMula,
              venue: item.lokasi,
            ),
          );
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
      Uri.parse(conf.eHadirAttendingActivityList),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: _refreshMsgList,
    );
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
