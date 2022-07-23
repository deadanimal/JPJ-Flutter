import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class CustomMenuItem {
  String? menu;
  ImageProvider? icon;
  late Function cbFunc;
  late bool needLoggedIn;
  int? serviceId;

  CustomMenuItem(
    String? menuText,
    String? iconPath,
    fx, {
    bool login = false,
    bool isSvg = false,
    id,
  }) {
    serviceId = id;
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
