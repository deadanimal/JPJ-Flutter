import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/spacing.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.label = "",
    required this.width,
    required this.onPressed,
    this.decoration,
    this.textColor = Colors.white,
  }) : super(key: key);
  final String label;
  final double width;
  final VoidCallback onPressed;
  final Decoration? decoration;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(vPaddingM),
        child: Container(
          decoration: decoration,
          child: Padding(
            padding: const EdgeInsets.all(vPaddingXs),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                onPressed();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 17,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
