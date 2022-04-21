import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/eAduanStatus/eaduan_status.dart';

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
  @override
  void initState() {
    super.initState();
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
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }
}
