import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/jpj_eq_operating_hour.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/jpjEqOperatingHour/jpj_eq_operating_hour.dart';

class JpjEqOperatingHourController extends StatefulWidget {
  const JpjEqOperatingHourController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqOperatingHourController();
}

class _JpjEqOperatingHourController
    extends State<JpjEqOperatingHourController> {
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
        body: JpjEqOperatingHour(
          backBtnCallback: _backBtnCallback,
          hours: [
            JpjBranchOperatingHour(
              close: false,
              day: "Monday",
              start: "09:00 AM",
              end: "10:00 PM",
            ),
            JpjBranchOperatingHour(
              close: false,
              day: "Tuesday - Friday",
              start: "09:00 AM",
              end: "8:00 PM",
            ),
            JpjBranchOperatingHour(
              close: true,
              day: "Saturday - Sunday",
            ),
          ],
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _backBtnCallback(BuildContext context) {
    Navigator.pop(context);
  }
}
