import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-number-queue/jpjeq_number_queue.dart';

class JpjEqNumberQueueController extends StatefulWidget {
  const JpjEqNumberQueueController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqNumberQueueController();
}

class _JpjEqNumberQueueController extends State<JpjEqNumberQueueController> {
  double currentLat = 1.857434, currentLong = 103.082021;
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
        body: JpjEqNumberQueue(),
        bottomNavigationBar: JpjEqBottomNavController(),
      ),
    );
  }
}
