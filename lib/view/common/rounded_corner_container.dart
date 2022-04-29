import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class RoundedCornerContainer extends StatelessWidget {
  const RoundedCornerContainer({
    Key? key,
    this.width,
    this.height,
    this.child,
    this.constraints,
    this.gradient,
    this.cornerRadius = 20,
    this.color = Colors.white,
  }) : super(key: key);
  final double? width;
  final double? height;
  final double cornerRadius;
  final Widget? child;
  final Color? color;
  final BoxConstraints? constraints;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: constraints,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        boxShadow: const [
          BoxShadow(
            color: Color(boxShadow),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        gradient: gradient,
        color: color,
      ),
      child: child,
    );
  }
}
