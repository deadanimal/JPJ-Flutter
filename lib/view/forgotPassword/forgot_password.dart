import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/template/template_header.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
    required this.emailController,
    required this.idController,
    this.submitCB,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController idController;
  final void Function(BuildContext)? submitCB;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ListView(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.forgotPasswordDot,
          ),
          Center(
            child: _foreground(context),
          ),
        ],
      ),
    );
  }

  Widget _foreground(context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      width: mediaWidth,
      height: mediaHeight,
      child: Column(
        children: [
          const SizedBox(height: vPaddingXL),
          const SizedBox(height: vPaddingXL),
          CustomLabel(
            deco: whiteBoxDecoRounded,
            label: AppLocalizations.of(context)!.enteric,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
          const SizedBox(height: vPaddingM),
          TextFieldForm(
            textController: idController,
            inputType: TextInputType.text,
            label: AppLocalizations.of(context)!.identification,
            width: mediaWidth - 64,
          ),
          const SizedBox(height: vPaddingM),
          CustomLabel(
            deco: whiteBoxDecoRounded,
            label: AppLocalizations.of(context)!.enterEmail,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
          const SizedBox(height: vPaddingM),
          TextFieldForm(
            textController: emailController,
            inputType: TextInputType.emailAddress,
            label: AppLocalizations.of(context)!.emailAddress,
            width: mediaWidth - 64,
          ),
          const SizedBox(height: vPaddingXL),
          const SizedBox(height: vPaddingXL),
          CustomButton(
            width: mediaWidth - 64,
            onPressed: () {
              if (submitCB != null) {
                submitCB!(context);
              }
            },
            decoration: navyGradientBtnDeco,
            label: AppLocalizations.of(context)!.submit,
          ),
        ],
      ),
    );
  }
}
