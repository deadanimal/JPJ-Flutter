import 'package:flutter/material.dart';

class MenuItem {
  String? menu;
  AssetImage? icon;
  var cbFunc;

  MenuItem(String menuText, String iconPath, fx) {
    menu = menuText;
    icon = AssetImage(iconPath);
    cbFunc = fx;
  }
}
