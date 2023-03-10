import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-number-called/jpjeq_number_call.dart';

class JpjEqNumberCallController extends StatefulWidget {
  const JpjEqNumberCallController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqNumberCallController();
}

class _JpjEqNumberCallController extends State<JpjEqNumberCallController> {
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
        body: JpjEqNumberCall(
          number: 8001, // todo: use actual number
          counterNumber: 4,
        ),
      ),
    );
  }
}
