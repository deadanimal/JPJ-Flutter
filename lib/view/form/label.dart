import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({
    Key? key,
    this.label = "NO LABEL",
    this.fontSize = 20,
    this.fontWeight = FontWeight.w700,
    this.endWidget = const SizedBox(),
  }) : super(key: key);

  final String label;
  final double fontSize;
  final FontWeight? fontWeight;
  final Widget endWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(themeNavy),
            fontSize: fontSize,
            fontFamily: "Poppins",
            fontWeight: fontWeight,
          ),
        ),
        endWidget,
      ],
    );
  }
}
