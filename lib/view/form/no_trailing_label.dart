import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class CustomNoTrailingLabel extends StatelessWidget {
  const CustomNoTrailingLabel({
    Key? key,
    this.label = "NO LABEL",
    this.fontSize = 20,
    required this.width,
    this.fontWeight = FontWeight.w700,
    this.endWidget = const SizedBox(),
    this.align = TextAlign.start,
  }) : super(key: key);

  final String label;
  final double fontSize;
  final double width;
  final FontWeight? fontWeight;
  final Widget endWidget;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Text(
            label,
            textAlign: align,
            style: TextStyle(
              color: const Color(themeNavy),
              fontSize: fontSize,
              fontFamily: "Roboto",
              fontWeight: fontWeight,
            ),
          ),
          endWidget,
        ],
      ),
    );
  }
}
