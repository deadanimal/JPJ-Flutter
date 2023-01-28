import 'package:flutter/material.dart';
import 'package:jpj_info/controller/ehadir_add_activity_controller.dart';
import 'package:jpj_info/controller/ehadir_mainpage_controller.dart';
import 'package:jpj_info/controller/first_time_login_controller.dart';
import 'package:jpj_info/controller/login_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/view/landingPage/landing_page.dart';

class LandingPageController extends StatefulWidget {
  const LandingPageController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LandingPageController();
}

class _LandingPageController extends State<LandingPageController> {
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
        body: LandingPage(),
      ),
    );
  }

  void _proceessLoginInfo(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 2500),
      () {
        if (MyJPJAccountManager().isLoggedIn &&
            MyJPJAccountManager().firstTime == "A ") {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder:
                  (context, animation, anotherAnimation, child) {
                return SlideTransition(
                  position: Tween(
                    begin: const Offset(0.0, 1.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );
              },
              pageBuilder: (_, __, ___) => const MainpageController(),
            ),
          );
        } else if (MyJPJAccountManager().isLoggedIn &&
            MyJPJAccountManager().firstTime == "F ") {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder:
                  (context, animation, anotherAnimation, child) {
                return SlideTransition(
                  position: Tween(
                    begin: const Offset(0.0, 1.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );
              },
              pageBuilder: (_, __, ___) => EhadirAddActivityController(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder:
                  (context, animation, anotherAnimation, child) {
                return SlideTransition(
                  position: Tween(
                    begin: const Offset(0.0, 1.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );
              },
              pageBuilder: (_, __, ___) => const LoginController(),
            ),
          );
        }
      },
    );
  }
}
