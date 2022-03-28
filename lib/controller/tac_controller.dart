import 'package:flutter/material.dart';
import 'package:jpj_info/controller/forgot_password_verified_controller.dart';
import 'package:jpj_info/view/appBarHeader/custom_appbar.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          darkBtn: true,
        ),
        body: Tac(
          submitCB: submitCallback,
        ),
      ),
    );
  }

  void submitCallback(BuildContext context, String tac) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ForgotPasswordVerifiedController();
        },
      ),
    );
  }
}
