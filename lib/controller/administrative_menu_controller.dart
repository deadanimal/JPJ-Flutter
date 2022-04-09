import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: const AdministrativeMenu(),
        bottomNavigationBar: BottomNavController(
          darkTheme: true,
          inProfile: true,
        ),
      ),
    );
  }
}
