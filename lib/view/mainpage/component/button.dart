import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/spacing.dart';
import '../../common/color_scheme.dart';

Widget button(btnText, btnImage, btnClickHandler, BuildContext context) {
  return Container(
    width: 129,
    height: 129,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(
          color: Color(btnShadow),
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
      ],
      color: const Color(btnColor),
    ),
    padding: const EdgeInsets.all(8),
    child: TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      onPressed: () {
        btnClickHandler(context);
      },
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  getIcon(btnImage),
                  btnTextWidget(btnText),
                ],
              ),
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
            size: 16.0,
          ),
        ],
      ),
    ),
  );
}

Widget getIcon(icon) {
  if (icon != null) {
    return Padding(
      padding: const EdgeInsets.only(bottom: vPaddingM),
      child: Image(
        image: icon,
        fit: BoxFit.fitWidth,
        alignment: Alignment.bottomCenter,
      ),
    );
  } else {
    return Container();
  }
}

Widget btnTextWidget(btnText) {
  return SizedBox(
    child: Text(
      btnText,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w900,
      ),
    ),
  );
}
