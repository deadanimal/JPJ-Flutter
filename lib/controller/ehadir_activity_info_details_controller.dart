import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/eHadirActivityInfo/ehadir_activity_info.dart';

class EhadirActivityInfoDetailsController extends StatefulWidget {
  const EhadirActivityInfoDetailsController({
    Key? key,
  }) : super(key: key);

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
        appBar: const AppBarController(
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: EhadirActivityInfo(
          tabController: tabController,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }
}
