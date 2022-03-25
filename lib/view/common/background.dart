import 'package:flutter/material.dart';
import 'package:jpj_info/controller/responsive.dart';

class Background {
  Decoration themeBackground(BuildContext context) {
    AssetImage image;
    if (Responsive().isMobile(context)) {
      image = const AssetImage("images/login_bg.png");
    } else {
      image = const AssetImage("images/main_bg.png");
    }
    return BoxDecoration(
      image: DecorationImage(
        image: image,
        fit: BoxFit.fitWidth,
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}
