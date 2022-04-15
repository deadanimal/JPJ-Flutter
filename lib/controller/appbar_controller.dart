import 'package:flutter/material.dart';
import 'package:jpj_info/controller/menu_action.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/view/appBarHeader/custom_appbar.dart';
import 'package:jpj_info/view/bottomDrawer/bottom_drawer.dart';

class AppBarController extends StatefulWidget implements PreferredSizeWidget {
  const AppBarController({
    Key? key,
    this.decor = const BoxDecoration(),
    this.darkBtn = false,
    this.iconColor = Colors.white,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _AppBarController();

  @override
  final Size preferredSize; // default is 56.0
  final BoxDecoration decor;
  final bool darkBtn;
  final Color iconColor;
}

class _AppBarController extends State<AppBarController> {
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
    Widget bottomDrawer = CustomBottomDrawer(
      inboxCallback: _inbox,
      logoutCallback: _logout,
      shareAppCallback: _shareApp,
    );
    return CustomAppBar(
      iconColor: widget.iconColor,
      darkBtn: widget.darkBtn,
      decor: widget.decor,
      bottomDrawer: bottomDrawer,
    );
  }

  void _inbox(BuildContext context) {
    inboxPage(context);
  }

  void _shareApp(BuildContext context) {}

  void _logout(BuildContext context) {
    MyJPJAccountManager().logOut(context);
  }
}
