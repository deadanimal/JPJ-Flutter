import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/template/template_header.dart';

class FirstTimePasswordChange extends StatelessWidget {
  const FirstTimePasswordChange({
    Key? key,
    required this.passwordController,
    required this.pwdConfirmController,
    this.submitCB,
  }) : super(key: key);
  final TextEditingController passwordController;
  final TextEditingController pwdConfirmController;
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
            headerTitle: AppLocalizations.of(context)!.setPassword,
          ),
          const SizedBox(height: vPaddingXL),
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
      height: mediaHeight / 2,
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.yourPasswordNeed,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.passwordInfo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.grey,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: vPaddingXL),
          const SizedBox(height: vPaddingM),
          const SizedBox(height: vPaddingM),
          TextFieldForm(
            textController: passwordController,
            obscureText: true,
            label: AppLocalizations.of(context)!.password,
            width: mediaWidth - 64,
          ),
          const SizedBox(height: vPaddingM),
          TextFieldForm(
            textController: pwdConfirmController,
            obscureText: true,
            label: AppLocalizations.of(context)!.verifyPassword,
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
