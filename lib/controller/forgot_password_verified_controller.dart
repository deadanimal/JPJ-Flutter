import 'package:flutter/material.dart';
import 'package:jpj_info/view/appBarHeader/custom_appbar.dart';
import 'package:jpj_info/view/forgotPasswordVerified/forgot_password_verified.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:jpj_info/view/mainpage/mainpage.dart';

class ForgotPasswordVerifiedController extends StatefulWidget {
  const ForgotPasswordVerifiedController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgotPasswordVerifiedController();
}

class _ForgotPasswordVerifiedController
    extends State<ForgotPasswordVerifiedController> {
  late TextEditingController _password;
  late TextEditingController _passwordConfirm;
  @override
  void initState() {
    super.initState();
    _password = TextEditingController();
    _passwordConfirm = TextEditingController();
  }

  @override
  void dispose() {
    _password.dispose();
    _passwordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
            darkBtn: true,
          ),
          body: ForgotPasswordVerified(
            passwordController: _password,
            pwdConfirmController: _passwordConfirm,
            submitCB: submitCallback,
          ),
        ),
      ),
    );
  }

  void submitCallback(BuildContext context) {
    TooltipInfo().showInfo(
      context,
      "Kata laluan anda",
      "telah berjaya dikemas kini",
      (c) => _onCloseSubmitInfo(c),
    );
  }

  void _onCloseSubmitInfo(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MainPage();
        },
      ),
    );
  }
}
