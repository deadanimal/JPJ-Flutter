import 'package:flutter/material.dart';
import 'package:jpj_info/view/appBarHeader/appBarHeader.dart';
import 'package:jpj_info/view/forgot_password/forgot_password.dart';
import 'package:jpj_info/view/mainpage/mainpage.dart';

class ForgotPasswordController extends StatefulWidget {
  const ForgotPasswordController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgotPasswordController();
}

class _ForgotPasswordController extends State<ForgotPasswordController> {
  late TextEditingController _email;
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
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
          body: ForgotPassword(
            emailController: _email,
            submitCB: submitCallback,
          ),
        ),
      ),
    );
  }

  void submitCallback(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MainPage();
        },
      ),
    );
  }
}
