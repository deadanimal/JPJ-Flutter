import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/background.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          CustomLabel(
            label: AppLocalizations.of(context)!.forgotPasswordDot,
          ),
          const SizedBox(height: vPaddingM),
          CustomLabel(
            label: AppLocalizations.of(context)!.enterEmail,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
          const SizedBox(height: vPaddingM),
          TextFieldForm(
            textController: emailController,
            inputType: TextInputType.emailAddress,
            label: AppLocalizations.of(context)!.emailAddress,
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
            label: AppLocalizations.of(context)!.submit,
          ),
        ],
      ),
    );
  }
}
