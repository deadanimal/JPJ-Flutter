import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';

class CustomBottomDrawer extends StatelessWidget {
  const CustomBottomDrawer({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final BottomDrawerController controller;

  @override
  Widget build(BuildContext context) {
    return BottomDrawer(
      /// your customized drawer header.
      header: Container(),

      /// your customized drawer body.
      body: Container(child: Text("data")),

      /// your customized drawer header height.
      headerHeight: 60.0,

      /// your customized drawer body height.
      drawerHeight: 180.0,

      /// drawer background color.
      color: Colors.lightBlue,

      /// drawer controller.
      controller: controller,
    );
  }
}
