import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/jpj_eq_branch_info.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/jpjEqBranchDetail/jpj_eq_branch_detail.dart';

import 'package:maps_launcher/maps_launcher.dart';

class JpjEqBranchDetailController extends StatefulWidget {
  const JpjEqBranchDetailController({
    Key? key,
    required this.branchInfo,
  }) : super(key: key);
  final JpjEqBranchInfo branchInfo;

  @override
  State<StatefulWidget> createState() => _JpjEqBranchDetailController();
}

class _JpjEqBranchDetailController extends State<JpjEqBranchDetailController> {
  @override
  void initState() {
    super.initState();
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
        body: JpjEqBranchDetail(
          backCB: _backCallback,
          branch: widget.branchInfo,
          openMapFx: _openMap,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _backCallback(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _openMap(String coordinate) {
    final splitted = coordinate.split(',');
    MapsLauncher.launchCoordinates(
      double.parse(splitted[0]),
      double.parse(splitted[1]),
    );
  }
}
