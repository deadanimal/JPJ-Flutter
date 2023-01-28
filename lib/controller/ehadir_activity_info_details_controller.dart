import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/qr_scanner.dart';
import 'package:jpj_info/model/ehadir_event_info.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/eHadirActivityInfo/ehadir_activity_info.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class EhadirActivityInfoDetailsController extends StatefulWidget {
  const EhadirActivityInfoDetailsController({
    Key? key,
    required this.event,
  }) : super(key: key);

  final EHadirEventInfo event;

  @override
  State<StatefulWidget> createState() => _EhadirActivityInfoDetailsController();
}

class _EhadirActivityInfoDetailsController
    extends State<EhadirActivityInfoDetailsController>
    with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
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
}
