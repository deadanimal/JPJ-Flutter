import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';

class CustomBorderedContainer extends StatelessWidget {
  const CustomBorderedContainer({
    Key? key,
    required this.child,
    required this.width,
    this.padding = const EdgeInsets.all(verticalPadding),
    this.decoration,
    this.topPadding = vPaddingXL,
  }) : super(key: key);
  final Widget child;
  final double width;
  final EdgeInsets padding;
  final Decoration? decoration;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Container(
        width: width,
        constraints: const BoxConstraints(maxWidth: 400),
        padding: padding,
        decoration: _getDecoration(),
        child: child,
      ),
    );
  }

  Decoration _getDecoration() {
    if (decoration != null) {
      return decoration!;
    } else {
      return BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(btnShadow),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      );
    }
  }
}
