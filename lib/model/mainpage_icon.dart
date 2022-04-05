import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class MenuItem {
  String? menu;
  ImageProvider? icon;
  var cbFunc;
  late bool needLoggedIn;

  MenuItem(String? menuText, String? iconPath, fx,
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
