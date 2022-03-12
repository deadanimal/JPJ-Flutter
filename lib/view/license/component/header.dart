import 'package:flutter/material.dart';
import '../../common/color_scheme.dart';

Widget licenseHeader() {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      boxShadow: [
        BoxShadow(
          color: Color(boxShadow),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Color(heederGradient1), Color(heederGradient2)],
      ),
    ),
    padding: const EdgeInsets.only(
      left: 4,
      right: 4,
      top: 8,
      bottom: 8,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                languageBtn(),
                faqBtn(),
              ],
            ),
            const Spacer(),
            menuBtn(),
          ],
        ),
        title(),
      ],
    ),
  );
}

Widget languageBtn() {
  return TextButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
    onPressed: () {},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Text(
          "EN",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    ),
  );
}

Widget faqBtn() {
  return TextButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
    onPressed: () {},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Text(
          "FAQ",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    ),
  );
}

Widget menuBtn() {
  return TextButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
    onPressed: () {},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        Icon(
          Icons.menu_rounded,
          color: Colors.white,
          size: 30.0,
        ),
      ],
    ),
  );
}

Widget title() {
  return Container(
    // padding: const EdgeInsets.all(24),
    padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
    child: const Text(
      "Lesen\nMemandu",
      style: TextStyle(
        color: Colors.white,
        fontSize: 55,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
