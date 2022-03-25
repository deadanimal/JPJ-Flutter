import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({
    Key? key,
    this.label = "NO LABEL",
    this.fontSize = 20,
    this.fontWeight = FontWeight.w700,
  }) : super(key: key);

  final String label;
  final double fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: const Color(themeNavy),
        fontSize: fontSize,
        fontFamily: "Poppins",
        fontWeight: fontWeight,
      ),
    );
  }
}
