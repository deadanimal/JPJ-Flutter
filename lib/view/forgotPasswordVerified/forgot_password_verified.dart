import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/background.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';

class ForgotPasswordVerified extends StatelessWidget {
  ForgotPasswordVerified({
    Key? key,
    this.screenHeight,
    this.screenWidth,
    required this.passwordController,
    required this.pwdConfirmController,
    this.submitCB,
  }) : super(key: key);

  double? screenHeight;
  double? screenWidth;
  final TextEditingController passwordController;
  final TextEditingController pwdConfirmController;
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
          CustomLabel(
            label: "Tukar Kata Laluan",
            endWidget: InkWell(
              onTap: () {
                TooltipInfo().showInfo(
                  context,
                  "Kata laluan anda perlu",
                  "mengandungi sekurang-kurangnya 8 aksara terdiri daripada gabungan huruf besar, huruf kecil, nombor dan simbol",
                  (c) => {},
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                ),
                child: Image(
                  image: AssetImage("images/info_tooltip_btn.png"),
                  width: 18,
                  height: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: vPaddingXL),
          const SizedBox(height: vPaddingM),
          const SizedBox(height: vPaddingM),
          TextFieldForm(
            textController: passwordController,
            obscureText: true,
            label: "Kata Laluan Baru",
            width: screenWidth! - 64,
          ),
          const SizedBox(height: vPaddingM),
          TextFieldForm(
            textController: pwdConfirmController,
            obscureText: true,
            label: "Pengesahan Kata Laluan Baru",
            width: screenWidth! - 64,
          ),
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
