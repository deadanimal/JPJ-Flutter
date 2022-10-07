import 'package:flutter/material.dart';
import 'package:jpj_info/controller/first_time_login_controller.dart';
import 'package:jpj_info/controller/login_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/view/welcomePage/welcome_page.dart';

class WelcomePageController extends StatefulWidget {
  const WelcomePageController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WelcomePageController();
}

class _WelcomePageController extends State<WelcomePageController> {
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
    _proceessLoginInfo(context);
    return const SafeArea(
      child: Scaffold(
        body: WelcomePage(),
      ),
    );
  }

  void _proceessLoginInfo(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        if (MyJPJAccountManager().isLoggedIn &&
            MyJPJAccountManager().firstTime == "A ") {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(seconds: 1),
              pageBuilder: (_, __, ___) => const MainpageController(),
            ),
          );
        } else if (MyJPJAccountManager().isLoggedIn &&
            MyJPJAccountManager().firstTime == "F ") {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(seconds: 1),
              pageBuilder: (_, __, ___) => const FirstTimeLoginController(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(seconds: 1),
              pageBuilder: (_, __, ___) => const LoginController(),
            ),
          );
        }
      },
    );
  }
}
