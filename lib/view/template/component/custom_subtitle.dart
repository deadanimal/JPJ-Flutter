import 'package:flutter/cupertino.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';

class CustomSubtitle extends StatelessWidget {
  const CustomSubtitle({
    Key? key,
    required this.subtitle,
  }) : super(key: key);
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(verticalPadding),
          child: Text(
            subtitle,
            style: const TextStyle(
              color: Color(themeNavy),
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
        ),
      ],
    );
  }
}
