import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/spacing.dart';

class CustomBorderedContainer extends StatelessWidget {
  const CustomBorderedContainer({
    Key? key,
    required this.child,
    required this.width,
    this.padding = const EdgeInsets.all(verticalPadding),
  }) : super(key: key);
  final Widget child;
  final double width;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: vPaddingXL),
      child: Container(
        width: width,
        constraints: const BoxConstraints(maxWidth: 400),
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
