import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
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
  @override
  void initState() {
    super.initState();
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
          qrData: "1231321654654545454848484777765465465432132165484797",
          staffName: "Test Name longTest Name longTest Name long",
          nric: "000000000000",
          scanQrBtnCallback: _scanQrBtnCallback,
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
}
