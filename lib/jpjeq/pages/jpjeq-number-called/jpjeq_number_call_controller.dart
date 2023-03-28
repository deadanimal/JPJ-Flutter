import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-number-called/jpjeq_number_call.dart';

class JpjEqNumberCallController extends StatefulWidget {
  const JpjEqNumberCallController({
    Key? key,
    required this.number,
    required this.counter,
  }) : super(key: key);
  final int number;
  final int counter;
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
    return SafeArea(
      child: Scaffold(
        body: JpjEqNumberCall(
          number: widget.number,
          counterNumber: widget.counter,
        ),
      ),
    );
  }
}
