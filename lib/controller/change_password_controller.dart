import 'package:flutter/material.dart';
import 'package:jpj_info/view/appBarHeader/appBarHeader.dart';
import 'package:jpj_info/view/change_password/change_password.dart';
import 'package:jpj_info/view/mainpage/mainpage.dart';

class ChangePasswordController extends StatefulWidget {
  const ChangePasswordController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangePasswordController();
}

class _ChangePasswordController extends State<ChangePasswordController> {
  late TextEditingController _oldPassword;
  late TextEditingController _password;
  late TextEditingController _passwordConfirm;
  @override
  void initState() {
    super.initState();
    _oldPassword = TextEditingController();
    _password = TextEditingController();
    _passwordConfirm = TextEditingController();
  }

  @override
  void dispose() {
    _oldPassword.dispose();
    _password.dispose();
    _passwordConfirm.dispose();
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
          body: ChangePassword(
            oldpasswordController: _oldPassword,
            passwordController: _password,
            pwdConfirmController: _passwordConfirm,
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
