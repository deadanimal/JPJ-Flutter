import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/listMenu/list_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JpjEqMenuController extends StatefulWidget {
  const JpjEqMenuController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqMenuController();
}

class _JpjEqMenuController extends State<JpjEqMenuController> {
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
          title: "JPJeQ",
          transactionList: MenuList(ctx: context).getJpjEqMenuList(),
        ),
        bottomNavigationBar: BottomNavController(
          darkTheme: true,
        ),
      ),
    );
  }
}
