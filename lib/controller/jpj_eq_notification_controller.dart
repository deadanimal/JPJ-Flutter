import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/jpj_eq_number_called_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/jpjEqNotification/jpj_eq_notification.dart';

class JpjEqNotificationController extends StatefulWidget {
  const JpjEqNotificationController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqNotificationController();
}

class _JpjEqNotificationController extends State<JpjEqNotificationController> {
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
        body: JpjEqNotification(
          openNotificationDetailsFx: _openNotificationDetails,
          //todo: use actual notification
          notifications: const [
            "Long notification will be shown like this. The quick brown fox jump over the lazy dog",
            "Short Notification",
            "C",
            "A",
            "B",
            "C",
            "A",
            "B",
            "C",
            "A",
            "B",
            "C",
            "A",
            "B",
            "C",
            "A",
            "B",
            "C",
          ],
        ),
        bottomNavigationBar: BottomNavController(
          darkTheme: true,
        ),
      ),
    );
  }

  void _openNotificationDetails(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const JpjEqNumberCalledController();
        },
      ),
    );
  }
}
