import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/listMenu/list_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnlineTransactionController extends StatefulWidget {
  const OnlineTransactionController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnlineTransactionController();
}

class _OnlineTransactionController extends State<OnlineTransactionController> {
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
        appBar: AppBarController(
          decor: customGradient,
          hasBackButton: true,
          backCb: (context) {
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
        body: CustomListMenu(
          title: AppLocalizations.of(context)!.onlineTransaction,
          transactionList: MenuList(ctx: context).getOnlineTransactionList(),
        ),
        bottomNavigationBar: BottomNavController(
          darkTheme: true,
        ),
      ),
    );
  }
}
