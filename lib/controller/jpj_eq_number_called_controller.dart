import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/jpjEqNumberCalled/jpj_eq_number_called.dart';

class JpjEqNumberCalledController extends StatefulWidget {
  const JpjEqNumberCalledController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqNumberCalledController();
}

class _JpjEqNumberCalledController extends State<JpjEqNumberCalledController> {
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
        body: JpjEqNumberCalled(
          backCB: _backCallback,
          counter: "Kaunter 2", //todo update to actual counter
          number: "1200",
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _backCallback(BuildContext context) {
    Navigator.of(context).pop();
  }
}
