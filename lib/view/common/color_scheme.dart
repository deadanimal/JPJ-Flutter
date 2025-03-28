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
const int markReadOrange = 0xfff8b518;
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
Decoration blueGradientBtnDeco = BoxDecoration(
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
    colors: [Color(0xff5A72E1), Color(0xff5264D8)],
  ),
);
Decoration greenGradientLoginBtnDeco = BoxDecoration(
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
    colors: [Color(0xff08C031), Color(0xff3DD009)],
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

Decoration greenGradientBtnDeco = BoxDecoration(
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
    colors: [
      Color(0xff4cac1e),
      Color(0xff436f0b),
    ],
  ),
);

Decoration navyGradientBtnDecoSquare = BoxDecoration(
  borderRadius: BorderRadius.circular(8),
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

Decoration yellowGradientBtnDeco = BoxDecoration(
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
    colors: [
      Color(0xfff8b518),
      Color(0xffc18b0e),
    ],
  ),
);

Decoration blackGradientSquareBtnDeco = BoxDecoration(
  borderRadius: BorderRadius.circular(8),
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
    colors: [
      Color.fromARGB(255, 0, 0, 0),
      Color.fromARGB(255, 46, 46, 46),
    ],
  ),
);
Decoration redGradientBtnDeco = BoxDecoration(
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
    colors: [Color(0xffe42222), Color(0xff721414)],
  ),
);

Decoration whiteBtnDecoSquare = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(8),
  boxShadow: const [
    BoxShadow(
      color: Color(0x3f000000),
      blurRadius: 4,
      offset: Offset(0, 4),
    ),
  ],
);

Decoration whiteBoxDecoRounded = BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  color: Colors.grey.shade100,
);
