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
}
