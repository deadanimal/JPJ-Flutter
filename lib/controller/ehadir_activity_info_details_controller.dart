import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/ehadir_add_comittee_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/qr_scanner.dart';
import 'package:jpj_info/model/ehadir/activity_list_res.dart';
import 'package:jpj_info/model/ehadir/comittee_list_req.dart';
import 'package:jpj_info/model/ehadir/comittee_list_res.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/eHadirActivityInfo/ehadir_activity_info.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;

class EhadirActivityInfoDetailsController extends StatefulWidget {
  const EhadirActivityInfoDetailsController({
    Key? key,
    required this.event,
  }) : super(key: key);

  final Aktiviti event;

  @override
  State<StatefulWidget> createState() => _EhadirActivityInfoDetailsController();
}

class _EhadirActivityInfoDetailsController
    extends State<EhadirActivityInfoDetailsController>
    with TickerProviderStateMixin {
  late TabController tabController;
  late List<ComitteeListRes> comitteeList;
  @override
  void initState() {
    super.initState();
    comitteeList = [];
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    Future.delayed(
      const Duration(milliseconds: 250),
      () {
        _getComitteeList(widget.event.id!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarController(
          decor: customGradient,
          iconColor: Colors.white,
          hasBackButton: true,
          darkBtn: false,
          backCb: (context) {
            Navigator.pop(context);
          },
        ),
        body: EhadirActivityInfo(
          tabController: tabController,
          qrScanCallback: _scanQrBtnCallback,
          event: widget.event,
          comitteeList: comitteeList,
          addMemberFx: addMemberFx,
        ),
        bottomNavigationBar: const BottomNavController(),
      ),
    );
  }

  void _scanQrBtnCallback() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return QrScanner(
            qrScanCallback: _qrScanCallback,
          );
        },
      ),
    );
  }

  void _qrScanCallback(Barcode barcode) {
    Navigator.pop(context);
  }

  void _committeeListCallback(http.Response response) {
    if (response.statusCode == 200) {
      comitteeList = [];
      for (var el in jsonDecode(response.body)) {
        comitteeList.add(ComitteeListRes.fromJson(el));
      }
      setState(() {});
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  void _getComitteeList(int activityId) {
    SiteConfig conf = SiteConfig();
    ComitteeListReq req = ComitteeListReq(
      idAktiviti: activityId,
    );
    return jpjHttpRequest(
      context,
      Uri.parse(conf.eHadirComitteeList),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: _committeeListCallback,
    );
  }

  addMemberFx(
    BuildContext context,
    int activityId,
    String transidAktiviti,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EhadirAddComitteeController(
            activityId: activityId,
            transidAktiviti: transidAktiviti,
          );
        },
      ),
    ).then((value) => {_getComitteeList(widget.event.id!)});
  }
}
