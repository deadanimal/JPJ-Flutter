import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CustomMenuItem {
  String? menu;
  ImageProvider? icon;
  late Function cbFunc;
  late bool needLoggedIn;

  CustomMenuItem(String? menuText, String? iconPath, fx,
      {bool login = false, bool isSvg = false}) {
    menu = menuText;
    if (iconPath != null) {
      if (isSvg) {
        icon = Svg(iconPath);
      } else {
        icon = AssetImage(iconPath);
      }
    }
    cbFunc = fx;
    needLoggedIn = login;
  }
}
