import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class CustomLabel extends StatelessWidget {
  const CustomLabel({
    Key? key,
    this.label = "NO LABEL",
    this.fontSize = 20,
    this.fontWeight = FontWeight.w700,
    this.endWidget = const SizedBox(),
    this.align = TextAlign.center,
  }) : super(key: key);

  final String label;
  final double fontSize;
  final FontWeight? fontWeight;
  final Widget endWidget;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              label,
              textAlign: align,
              style: TextStyle(
                color: const Color(themeNavy),
                fontSize: fontSize,
                fontFamily: "Roboto",
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
        endWidget,
      ],
    );
  }
}
