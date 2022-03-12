import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';

PreferredSizeWidget appBarHeader() {
  return AppBar(
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(heederGradient1), Color(heederGradient2)],
        ),
      ),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            const SizedBox(width: horizontalPadding),
            languageBtn(),
            const SizedBox(width: horizontalPadding),
            faqBtn(),
          ],
        ),
      ),
    ),
  );
}

Widget languageBtn() {
  return InkWell(
    onTap: () {},
    child: const SizedBox(
      child: Text(
        "EN",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
  );
}

Widget faqBtn() {
  return InkWell(
    onTap: () {},
    child: const SizedBox(
      child: Text(
        "FAQ",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w900,
        ),
      ),
    ),
  );
}
