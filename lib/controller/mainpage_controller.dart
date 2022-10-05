import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/forgot_password_controller.dart';
import 'package:jpj_info/controller/new_registration_controller.dart';
import 'package:jpj_info/helper/exit_prompt.dart';
import 'package:jpj_info/helper/fav_menu.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
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
    Future.delayed(
      const Duration(milliseconds: 250),
      refresh,
    );
  }

  @override
  void dispose() {
    _userId.dispose();
    _userPwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CustomMenuItem> favMenuList = FavMenu().getFavMenuItem(context);
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
          body: MainPage(favMenuList: favMenuList),
          bottomNavigationBar: BottomNavController(
            darkTheme: true,
            inHome: true,
          ),
        ),
      ),
    );
  }

  bool isLoggedIn() {
    return false; // check for saved login detail
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

  void refresh() {
    print("ppp");
    setState(() {});
    Future.delayed(
      const Duration(milliseconds: 1000),
      refresh,
    );
  }
}
