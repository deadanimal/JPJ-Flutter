import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/aduan_status_response.dart';
import 'package:jpj_info/model/check_id_request.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/eAduanStatus/eaduan_status.dart';
import 'package:http/http.dart' as http;

class EaduanStatusController extends StatefulWidget {
  const EaduanStatusController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EaduanStatusController();
}

class _EaduanStatusController extends State<EaduanStatusController>
    with TickerProviderStateMixin {
  late TabController tabController;
  late List<AduanStatusResponse> res = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      getComplaintList();
    });
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
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
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: EaduanStatus(
          tabController: tabController,
          res: res,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  _responseHandler(http.Response response) {
    if (response.statusCode == 200) {
      for (var element in jsonDecode(response.body)) {
        res.add(AduanStatusResponse.fromJson(element));
      }
      setState(() {
        res;
      });
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  void getComplaintList() {
    SiteConfig conf = SiteConfig();
    CheckIdRequest req = CheckIdRequest(nokp: MyJPJAccountManager().id);
    jpjHttpRequest(
      context,
      Uri.parse(conf.aduanStatusUri),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: _responseHandler,
    );
  }
}
