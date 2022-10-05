import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/template/template_header.dart';

class ForgotPasswordVerified extends StatelessWidget {
  const ForgotPasswordVerified({
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
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/main_bg.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.changePassword,
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
          const SizedBox(height: vPaddingXL),
          Text(
            AppLocalizations.of(context)!.yourPasswordNeed,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.passwordInfo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
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
            label: AppLocalizations.of(context)!.newPassword,
            width: mediaWidth - 64,
          ),
          const SizedBox(height: vPaddingM),
          TextFieldForm(
            textController: pwdConfirmController,
            obscureText: true,
            label: AppLocalizations.of(context)!.verifyNewPassword,
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
