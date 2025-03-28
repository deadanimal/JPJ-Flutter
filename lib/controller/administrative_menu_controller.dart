import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/helper/exit_prompt.dart';
import 'package:jpj_info/view/administrativeMenu/administrative_menu.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';

class AdministrativeMenuController extends StatefulWidget {
  const AdministrativeMenuController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AdministrativeMenuController();
}

class _AdministrativeMenuController
    extends State<AdministrativeMenuController> {
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
    return WillPopScope(
      onWillPop: () {
        return Exitprompter().prompt(context);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarController(
            decor: customGradient,
            backCb: (c) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MainpageController();
                  },
                ),
              );
            },
          ),
          body: const AdministrativeMenu(),
          bottomNavigationBar: BottomNavController(
            darkTheme: true,
            inProfile: true,
          ),
        ),
      ),
    );
  }
}
