import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_get_ticket_number_response.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-number-queue/jpjeq_number_queue.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

class JpjEqNumberQueueController extends StatefulWidget {
  const JpjEqNumberQueueController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqNumberQueueController();
}

class _JpjEqNumberQueueController extends State<JpjEqNumberQueueController> {
  JpjEqGetTicketNumberResponse ticketInfo = JpjEqGetTicketNumberResponse();
  late Timer? t;
  @override
  void initState() {
    super.initState();
    getNumberInfo();
  }

  @override
  void dispose() {
    if (t != null) {
      t!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: JpjEqNumberQueue(ticketInfo: ticketInfo),
        bottomNavigationBar: const JpjEqBottomNavController(),
      ),
    );
  }

  getNumberInfo() {
    SharedPreferences.getInstance().then(
      (value) async {
        String? rawValue = value.getString(
          LocalStorageHelper().jpjeQNumberInfo,
        );
        if (rawValue != null) {
          setState(() {
            ticketInfo = JpjEqGetTicketNumberResponse.fromJson(
              jsonDecode(
                rawValue,
              ),
            );
          });
          Workmanager().registerOneOffTask(
            "TestTask",
            "eqCheckNumberRefresh",
            initialDelay: const Duration(seconds: 1),
          );

          Workmanager().registerPeriodicTask(
            "task2",
            "eqCheckNumberRefresh",
            frequency: const Duration(minutes: 15),
            initialDelay: const Duration(seconds: 1),
            constraints: Constraints(networkType: NetworkType.connected),
          );

          Future.delayed(
            const Duration(milliseconds: 6000),
            checkForChanges,
          );
        } else {}
      },
    );

    // Workmanager().registerPeriodicTask(
    //   "task2",
    //   "eqCheckNumberRefresh",
    //   frequency: const Duration(minutes: 15),
    //   initialDelay: const Duration(seconds: 5),
    //   constraints: Constraints(networkType: NetworkType.connected),
    // );
  }

  checkForChanges() {
    SharedPreferences.getInstance().then((value) {
      String? rawValue = value.getString(
        LocalStorageHelper().jpjeQNumberInfo,
      );
      print("sequential read: " + rawValue!);
      if (rawValue != null) {
        setState(() {
          ticketInfo = JpjEqGetTicketNumberResponse.fromJson(
            jsonDecode(
              rawValue,
            ),
          );
        });
      } else {}
    });

    t = Timer(const Duration(seconds: 10), () {
      checkForChanges();
    });
  }
}
