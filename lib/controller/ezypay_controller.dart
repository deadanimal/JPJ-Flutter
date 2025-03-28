import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/listMenu/list_menu.dart';

class EzypayMenuController extends StatefulWidget {
  const EzypayMenuController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EzypayMenuController();
}

class _EzypayMenuController extends State<EzypayMenuController> {
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
          title: "EzyPay",
          transactionList: MenuList(ctx: context).getEzypayMenuList(),
        ),
        bottomNavigationBar: BottomNavController(
          darkTheme: true,
        ),
      ),
    );
  }
}
