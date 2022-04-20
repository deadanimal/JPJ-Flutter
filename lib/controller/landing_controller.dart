import 'package:flutter/material.dart';
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
    // todo: this is where APP should send request to server to verify user login token
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        if (MyJPJAccountManager().isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const MainpageController();
              },
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const LoginController();
              },
            ),
          );
        }
      },
    );
  }
}
