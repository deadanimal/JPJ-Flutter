import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/listMenu/list_menu.dart';

class JpjEhadirMenuController extends StatefulWidget {
  const JpjEhadirMenuController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEhadirMenuController();
}

class _JpjEhadirMenuController extends State<JpjEhadirMenuController> {
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
        body: CustomListMenu(
          title: "JPJeHadir",
          transactionList: MenuList(ctx: context).getJpjEHadirMenuList(),
        ),
        bottomNavigationBar: BottomNavController(
          darkTheme: true,
        ),
      ),
    );
  }
}
