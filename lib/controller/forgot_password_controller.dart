import 'package:flutter/material.dart';
import 'package:jpj_info/controller/tac_controller.dart';
import 'package:jpj_info/view/appBarHeader/custom_appbar.dart';
import 'package:jpj_info/view/forgotPassword/forgot_password.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';

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
          appBar: const CustomAppBar(
            darkBtn: true,
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
    TooltipInfo().showInfo(
      context,
      "Kod TAC telah dihantar",
      "sila semak e-mel anda",
      (c) => _onCloseSubmitInfo(c),
    );
  }

  void _onCloseSubmitInfo(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const TacController();
        },
      ),
    );
  }
}
