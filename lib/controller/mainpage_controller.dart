import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/forgot_password_controller.dart';
import 'package:jpj_info/controller/new_registration_controller.dart';
import 'package:jpj_info/helper/exit_prompt.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/mainpage/mainpage.dart';

class MainpageController extends StatefulWidget {
  const MainpageController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainpageController();
}

class _MainpageController extends State<MainpageController> {
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
    return WillPopScope(
      onWillPop: () {
        return Exitprompter().prompt(context);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: const AppBarController(
            hasBackButton: false,
            decor: customGradient,
          ),
          body: const MainPage(),
          bottomNavigationBar: BottomNavController(
            darkTheme: true,
            inHome: true,
          ),
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
          return const MainPage();
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
          return const MainPage();
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
