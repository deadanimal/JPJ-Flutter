import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
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
  BottomDrawerController controller = BottomDrawerController();
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
    return CustomAppBar(
      iconColor: widget.iconColor,
      darkBtn: widget.darkBtn,
      decor: widget.decor,
    );
  }
}
