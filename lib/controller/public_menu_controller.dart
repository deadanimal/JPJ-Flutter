import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/listMenu/list_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          hasBackButton: false,
        ),
        body: CustomListMenu(
          title: AppLocalizations.of(context)!.public,
          transactionList: MenuList(ctx: context).getPublicMenuList(),
        ),
        bottomNavigationBar: BottomNavController(
          darkTheme: true,
          inMenu: true,
        ),
      ),
    );
  }
}
