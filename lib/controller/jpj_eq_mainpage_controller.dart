import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/jpj_eq_operating_hour_controller.dart';
import 'package:jpj_info/helper/qr_scanner.dart';
import 'package:jpj_info/model/jpj_location_response.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/jpjEqMainPage/jpj_eq_mainpage.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JpjEqMainPageController extends StatefulWidget {
  const JpjEqMainPageController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqMainPageController();
}

class _JpjEqMainPageController extends State<JpjEqMainPageController> {
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
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: JpjEqMainPage(
          // todo: use actual qr data
          qrData: "1231321654654545454848484777765465465432132165484797",
          scanQrBtnCallback: _scanQrBtnCallback,
          branchData: JpjLocationResponseData(
              id: "1",
              address: "Jalan Teknokrat 5, Cyberjaya",
              coordinate: "123.1, 1.3",
              name: "JPJ Cawangan Jempol (Bawah)"),
        ),
        bottomNavigationBar: BottomNavController(),
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

  Future<void> _qrScanCallback(Barcode barcode) async {
    Navigator.pop(context);
    try {
      // String? qrData = barcode.rawValue;
      // todo: use qrData to query the location information
      // todo: parse Data and move to next screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const JpjEqOperatingHourController();
          },
        ),
      );
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
