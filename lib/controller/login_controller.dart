import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/forgot_password_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/controller/new_registration_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/login/login.dart';

class LoginController extends StatefulWidget {
  const LoginController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginController();
}

class _LoginController extends State<LoginController> {
  late TextEditingController _userId;
  late TextEditingController _userPwd;
  @override
  void initState() {
    super.initState();
    _userId = TextEditingController();
    _userPwd = TextEditingController();
  }

  @override
  void dispose() {
    _userId.dispose();
    _userPwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: Login(
          userId: _userId,
          userPwd: _userPwd,
          logAsGuessCB: logAsGuess,
          newAccountCB: newRegistration,
          logInCB: login,
          forgotPasswordCB: forgotPassword,
        ),
      ),
    );
  }

  void login(BuildContext context) {
    // Add field checking
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MainpageController();
        },
      ),
    );
  }

  bool isLoggedIn() {
    return false; // check for saved login detail
  }

  void logAsGuess(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MainpageController();
        },
      ),
    );
  }

  void newRegistration(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const NewRegistrationController();
        },
      ),
    );
  }

  void forgotPassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ForgotPasswordController();
        },
      ),
    );
  }
}
