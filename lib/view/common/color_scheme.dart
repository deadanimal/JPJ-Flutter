import 'package:flutter/material.dart';

const int btnColor = 0xff2b388d;
const int btnShadow = 0x3f000000;
const int secondaryColor = 0xff354c96;
const int secondaryColor3 = 0xffd6d9e9;
const int boxShadow = 0x59000000;
const int headerGradient1 = 0xff2b388d;
const int headerGradient2 = 0xff171f44;
const int themeOrange = 0xffd06400;
const int themeNavy = 0xff171f44;
const int themeGray = 0xff6b7b8a;
const int errorRed = 0xffea4026;
Decoration orangeGradientBtnDeco = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  boxShadow: const [
    BoxShadow(
      color: Color(0x3f000000),
      blurRadius: 4,
      offset: Offset(0, 4),
    ),
  ],
  gradient: const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xfff8b518), Color(0xffc18b0e)],
  ),
);
Decoration navyGradientBtnDeco = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  boxShadow: const [
    BoxShadow(
      color: Color(0x3f000000),
      blurRadius: 4,
      offset: Offset(0, 4),
    ),
  ],
  gradient: const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(headerGradient1), Color(headerGradient2)],
  ),
);
Decoration whiteBtnDeco = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(15),
  boxShadow: const [
    BoxShadow(
      color: Color(0x3f000000),
      blurRadius: 4,
      offset: Offset(0, 4),
    ),
  ],
);
Decoration whiteFadedBtnDeco = BoxDecoration(
  color: Colors.white70,
  borderRadius: BorderRadius.circular(15),
  boxShadow: const [
    BoxShadow(
      color: Color(0x3f000000),
      blurRadius: 4,
      offset: Offset(0, 4),
    ),
  ],
);
