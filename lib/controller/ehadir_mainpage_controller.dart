import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/ehadir_activity_list_controller.dart';
import 'package:jpj_info/controller/ehadir_comittee_page_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/qr_scanner.dart';
import 'package:jpj_info/model/ehadir_event_info.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/eHadirConfirmedAttendance/ehadir_confirmed_attendance.dart';
import 'package:jpj_info/view/eHadirMainPage/ehadir_mainpage.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EhadirMainPageController extends StatefulWidget {
  const EhadirMainPageController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EhadirMainPageController();
}

class _EhadirMainPageController extends State<EhadirMainPageController> {
  late ImagePicker picker;
  late List<Uint8List> images;
  String qrData = '';
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 250),
      _generateQr,
    );
    picker = ImagePicker();
    images = [];
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
        body: EhadirMainPage(
          qrData: qrData,
          staffName: "Test Name longTest Name longTest Name long",
          nric: "000000000000",
          scanQrBtnCallback: _scanQrBtnCallback,
          activityBtnCb: _navToActivityPage,
          comiteeBtnCb: _navToComiteePage,
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

  void _navToActivityPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const EhadirActivityListController();
        },
      ),
    );
  }

  void _navToComiteePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const EhadirComitteePageController();
        },
      ),
    );
  }

  void _qrScanCallback(Barcode barcode) {
    Navigator.pop(context);
    try {
      // String? qrData = barcode.rawValue;
      // todo: use qrData to query the event information
      rootBundle.loadString('json/ehadir_event.json').then((response) {
        final data = json.decode(response);
        EHadirEventInfo eventInfo = EHadirEventInfo.fromJson(data);
        // todo: parse Data and move to next screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EhadirConfirmAttendance(
                eventName: eventInfo.eventName!,
                vanue: eventInfo.venue!,
                date: eventInfo.date!,
                startTime: eventInfo.startTime!,
                endTime: eventInfo.endTime!,
              );
            },
          ),
        );
      });
    } catch (e) {
      AlertController(ctx: context).generalError(
        AppLocalizations.of(context)!.invalidQrCode,
        () {
          Navigator.pop(context);
        },
      );
    }
  }

  _generateQr() {
    // qrData
    SiteConfig conf = SiteConfig();

    jpjHttpRequest(
      context,
      Uri.parse(conf.eHadirAttendeeQr),
      headers: conf.formHeader,
      body: jsonEncode({
        'nokp': MyJPJAccountManager().id,
      }),
      callback: (res) {
        if (res.statusCode == 200) {
          setState(() {
            qrData = res.body;
          });
        }
      },
    );
  }
}
