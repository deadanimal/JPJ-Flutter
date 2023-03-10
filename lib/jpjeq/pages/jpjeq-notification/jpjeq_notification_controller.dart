import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-notification/jpjeq_notification.dart';

class JpjEqNotificationController extends StatefulWidget {
  const JpjEqNotificationController({Key? key}) : super(key: key);

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
    return const SafeArea(
      child: Scaffold(
        body: JpjEqNotification(),
        bottomNavigationBar: JpjEqBottomNavController(pageNumber: 2),
      ),
    );
  }
}
