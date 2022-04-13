import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/publicMenu/public_menu.dart';

class PublicMenuController extends StatefulWidget {
  const PublicMenuController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PublicMenuController();
}

class _PublicMenuController extends State<PublicMenuController> {
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
        body: const PublicMenuList(),
        bottomNavigationBar: BottomNavController(
          darkTheme: true,
          inMenu: true,
        ),
      ),
    );
  }
}
