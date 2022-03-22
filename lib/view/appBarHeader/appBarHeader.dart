import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';

PreferredSizeWidget appBarHeader({
  int gradient1 = heederGradient1,
  int gradient2 = heederGradient2,
}) {
  BoxDecoration decor;
  bool darkBtn = false;
  if (gradient1 != gradient2) {
    decor = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Color(gradient1), Color(gradient2)],
      ),
    );
  } else {
    darkBtn = true;
    decor = const BoxDecoration();
  }
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    flexibleSpace: Container(
      decoration: decor,
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            const SizedBox(width: horizontalPadding),
            languageBtn(darkBtn),
            const SizedBox(width: horizontalPadding),
            faqBtn(darkBtn),
          ],
        ),
      ),
    ),
  );
}

Widget languageBtn(bool darkBtn) {
  return InkWell(
    onTap: () {},
    child: SizedBox(
      child: Text(
        "EN",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: darkBtn == true ? const Color(secondaryColor) : Colors.white,
          fontSize: 12,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
  );
}

Widget faqBtn(bool darkBtn) {
  return InkWell(
    onTap: () {},
    child: SizedBox(
      child: Text(
        "FAQ",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: darkBtn == true ? const Color(secondaryColor) : Colors.white,
          fontSize: 12,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
  );
}
