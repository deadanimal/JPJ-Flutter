import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPin extends StatelessWidget {
  const CustomPin({
    Key? key,
    this.submitCB,
    this.width = 256.0,
  }) : super(key: key);

  final Function(BuildContext, String)? submitCB;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PinCodeTextField(
          length: 4,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 50,
            activeFillColor: Colors.white,
            activeColor: const Color(themeNavy),
            selectedColor: const Color(themeNavy),
            inactiveColor: const Color(themeNavy),
            selectedFillColor: Colors.white,
            inactiveFillColor: Colors.grey.shade200,
          ),
          cursorColor: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          autoFocus: true,
          boxShadows: const [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          // controller: textController,
          onCompleted: (v) {
            if (submitCB != null) {
              submitCB!(context, v);
            }
          },
          onChanged: (value) {
            print(value);
          },
          beforeTextPaste: (text) {
            print("Allowing to paste $text");
            return true;
          },
          appContext: context,
        ),
      ),
    );
  }
}
