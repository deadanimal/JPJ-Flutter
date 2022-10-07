import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/template/template_header.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({
    Key? key,
    required this.passwordController,
    required this.pwdConfirmController,
    required this.oldpasswordController,
    this.submitCB,
  }) : super(key: key);
  final TextEditingController oldpasswordController;
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
      height: mediaHeight,
      child: Column(
        children: [
          const SizedBox(height: vPaddingXL),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0),
            child: Text(
              AppLocalizations.of(context)!.yourPasswordNeed,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0),
            child: Text(
              AppLocalizations.of(context)!.passwordInfo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: vPaddingXL),
          TextFieldForm(
            textController: oldpasswordController,
            obscureText: true,
            label: AppLocalizations.of(context)!.yourPassword,
            width: mediaWidth - 64,
          ),
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
            decoration: navyGradientBtnDecoSquare,
            label: "Hantar",
          ),
        ],
      ),
    );
  }
}
