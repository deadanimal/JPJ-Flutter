import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/template/template_header.dart';

class Login extends StatelessWidget {
  const Login({
    Key? key,
    required this.userId,
    required this.userPwd,
    this.newAccountCB,
    this.logInCB,
    this.forgotPasswordCB,
  }) : super(key: key);

  final TextEditingController userId;
  final TextEditingController userPwd;
  final void Function(BuildContext)? newAccountCB;
  final void Function(BuildContext)? logInCB;
  final void Function(BuildContext)? forgotPasswordCB;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: "headerAnim",
              child: TemplateHeader(
                header: Center(
                  child: Text(
                    AppLocalizations.of(context)!.logIn,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            _foreground(context),
          ],
        ),
      ),
    );
  }

  Widget _foreground(context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      width: mediaWidth,
      child: Column(
        children: [
          const SizedBox(height: vPaddingXL),
          _loginField(context),
          const SizedBox(height: verticalPadding),
        ],
      ),
    );
  }

  Widget _loginField(context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 64,
        right: 64,
      ),
      child: Column(
        children: [
          const SizedBox(height: vPaddingXL),
          TextFieldForm(
            textController: userId,
            label: AppLocalizations.of(context)!.userID,
            width: mediaWidth - 64,
          ),
          const SizedBox(height: 8),
          TextFieldForm(
            obscureText: true,
            textController: userPwd,
            label: AppLocalizations.of(context)!.password,
            width: mediaWidth - 64,
          ),
          const SizedBox(height: 8),
          CustomButton(
            width: mediaWidth - 64,
            label: AppLocalizations.of(context)!.logIn,
            decoration: blueGradientBtnDeco,
            onPressed: () {
              if (logInCB != null) {
                logInCB!(context);
              }
            },
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.changePaswordInfo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              if (forgotPasswordCB != null) {
                forgotPasswordCB!(context);
              }
            },
            child: Chip(
              backgroundColor: Colors.white,
              label: Text(
                AppLocalizations.of(context)!.forgotPassword,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Color(0xff4208BD),
                  fontSize: 15,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 91,
            height: 20,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 3),
                Text(
                  AppLocalizations.of(context)!.or,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 3),
                Container(
                  width: 24,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          CustomButton(
            width: mediaWidth - 64,
            label: AppLocalizations.of(context)!.registerNewAccount,
            decoration: greenGradientLoginBtnDeco,
            textColor: Colors.white,
            onPressed: () {
              if (newAccountCB != null) {
                newAccountCB!(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
