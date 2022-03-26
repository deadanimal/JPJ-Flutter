import 'package:flutter/material.dart';
import 'package:jpj_info/controller/change_password_controller.dart';
import 'package:jpj_info/view/appBarHeader/appBarHeader.dart';
import 'package:jpj_info/view/tac/tac.dart';

class TacController extends StatefulWidget {
  const TacController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TacController();
}

class _TacController extends State<TacController> {
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
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: appBarHeader(
            gradient1: 0,
            gradient2: 0,
          ),
          body: Tac(
            submitCB: submitCallback,
          ),
        ),
      ),
    );
  }

  void submitCallback(BuildContext context, String tac) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ChangePasswordController();
        },
      ),
    );
  }
}
