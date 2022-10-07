import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/eaduan_status_draft_controller.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/eAduanMenu/eaduan_menu.dart';

class EaduanMenuController extends StatefulWidget {
  const EaduanMenuController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EaduanMenuController();
}

class _EaduanMenuController extends State<EaduanMenuController> {
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
        body: EaduanMenu(
          title: "eAduan @JPJ",
          transactionList: MenuList(ctx: context).getEaduanMenuList(),
          draftStatusCallback: _draftStatusCallback,
        ),
        bottomNavigationBar: BottomNavController(
          darkTheme: true,
        ),
      ),
    );
  }

  void _draftStatusCallback(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const EaduanStatusController();
        },
      ),
    );
  }
}
