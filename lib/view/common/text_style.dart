import 'package:flutter/cupertino.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class CustomTextStyle {
  TextStyle paragraph({
    fontColor = const Color(themeNavy),
  }) {
    return TextStyle(
      color: fontColor,
      fontSize: 12,
    );
  }

  TextStyle mainHeader({
    fontColor = const Color(themeNavy),
  }) {
    return TextStyle(
      color: fontColor,
      fontSize: 30,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w900,
    );
  }

  TextStyle subHeader({
    fontColor = const Color(themeGray),
  }) {
    return TextStyle(
      color: fontColor,
      fontSize: 25,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w700,
    );
  }
}
