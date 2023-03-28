import 'package:flutter/material.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-notification/jpjeq_notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JpjEqNotificationController extends StatefulWidget {
  const JpjEqNotificationController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqNotificationController();
}

class _JpjEqNotificationController extends State<JpjEqNotificationController> {
  List<String> notificationList = [];
  @override
  void initState() {
    super.initState();
    getNotification();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: JpjEqNotification(
          notificationList: notificationList,
        ),
        bottomNavigationBar: const JpjEqBottomNavController(pageNumber: 2),
      ),
    );
  }

  getNotification() {
    SharedPreferences.getInstance().then(
      (value) {
        notificationList = value.getStringList(
              LocalStorageHelper().jpjeQNotificationHistory,
            ) ??
            [];

        setState(() {});
      },
    );
  }
}
