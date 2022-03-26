import 'package:flutter/material.dart';

class FaqBtn extends StatelessWidget {
  const FaqBtn({Key? key, this.dark = false}) : super(key: key);

  final bool dark;

  @override
  Widget build(BuildContext context) {
    AssetImage iconImage;
    if (dark) {
      iconImage = const AssetImage("images/faq_icon.png");
    } else {
      iconImage = const AssetImage("images/faq_icon_light.png");
    }
    return InkWell(
      onTap: () {},
      child: Image(
        image: iconImage,
      ),
    );
  }
}
