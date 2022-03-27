import 'package:flutter/material.dart';
import 'package:jpj_info/view/appBarHeader/lang_selector.dart';

class LanguageBtn extends StatelessWidget {
  const LanguageBtn({Key? key, this.dark = false}) : super(key: key);

  final bool dark;

  @override
  Widget build(BuildContext context) {
    AssetImage iconImage;
    if (dark) {
      iconImage = const AssetImage("images/en_lg_icon.png");
    } else {
      iconImage = const AssetImage("images/en_lg_icon_light.png");
    }
    return InkWell(
      onTap: () {
        LanguageSelector().showInfo(context);
      },
      child: Image(
        height: 24,
        image: iconImage,
      ),
    );
  }
}
