import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/background.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({
    Key? key,
    this.screenHeight,
    this.screenWidth,
    required this.emailController,
    this.submitCB,
  }) : super(key: key);

  double? screenHeight;
  double? screenWidth;
  final TextEditingController emailController;
  final void Function(BuildContext)? submitCB;

  @override
  Widget build(BuildContext context) {
    screenWidth = (MediaQuery.of(context).size.width);
    screenHeight = (MediaQuery.of(context).size.height);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: Background().themeBackground(context),
      child: Center(
        child: _foreground(context),
      ),
    );
  }

  Widget _foreground(context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      width: screenWidth,
      height: screenHeight! / 2,
      child: Column(
        children: [
          const CustomLabel(
            label: "Lupa Kata Laluan",
          ),
          const SizedBox(height: vPaddingM),
          const CustomLabel(
            label: "Sila masukkan alamat e-mel anda",
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
          const SizedBox(height: vPaddingM),
          TextFieldForm(
            textController: emailController,
            inputType: TextInputType.emailAddress,
            label: "Alamat e-mel",
            width: screenWidth! - 64,
          ),
          const SizedBox(height: vPaddingXL),
          const SizedBox(height: vPaddingXL),
          const SizedBox(height: vPaddingXL),
          CustomButton(
            width: screenWidth! - 64,
            onPressed: () {
              if (submitCB != null) {
                submitCB!(context);
              }
            },
            decoration: orangeGradientBtnDeco,
            label: "Hantar",
          ),
        ],
      ),
    );
  }
}
