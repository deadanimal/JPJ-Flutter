import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Login extends StatelessWidget {
  Login({
    Key? key,
    this.screenHeight,
    this.screenWidth,
    required this.userId,
    required this.userPwd,
    this.newAccountCB,
    this.logInCB,
    this.logAsGuessCB,
    this.forgotPasswordCB,
  }) : super(key: key);

  double? screenHeight;
  double? screenWidth;
  final TextEditingController userId;
  final TextEditingController userPwd;
  final void Function(BuildContext)? newAccountCB;
  final void Function(BuildContext)? logInCB;
  final void Function(BuildContext)? logAsGuessCB;
  final void Function(BuildContext)? forgotPasswordCB;

  @override
  Widget build(BuildContext context) {
    screenWidth = (MediaQuery.of(context).size.width);
    screenHeight = (MediaQuery.of(context).size.height);
    return Material(
      child: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login_bg.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _foreground(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _foreground(context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      width: screenWidth,
      child: Column(
        children: [
          _logo(context),
          const SizedBox(height: verticalPadding),
          _loginField(context),
          const SizedBox(height: verticalPadding),
        ],
      ),
    );
  }

  Widget _logo(context) {
    return Center(
      child: Image(
        image: const AssetImage("images/myjpj_logo_large.png"),
        width: screenWidth! / 3,
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
          CustomLabel(
            label: AppLocalizations.of(context)!.logIn,
          ),
          const SizedBox(height: 8),
          TextFieldForm(
            textController: userId,
            label: AppLocalizations.of(context)!.userID,
            width: screenWidth! - 64,
          ),
          const SizedBox(height: 8),
          TextFieldForm(
            obscureText: true,
            textController: userPwd,
            label: AppLocalizations.of(context)!.password,
            width: screenWidth! - 64,
          ),
          Container(
            alignment: Alignment.centerRight,
            width: screenWidth! - 64,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  if (forgotPasswordCB != null) {
                    forgotPasswordCB!(context);
                  }
                },
                child: Chip(
                  backgroundColor: const Color(themeNavy),
                  label: Text(
                    AppLocalizations.of(context)!.forgotPassword,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey.shade200,
                      shadows: const [
                        Shadow(color: Colors.grey, blurRadius: 4.0),
                      ],
                      fontSize: 12,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          CustomButton(
            width: screenWidth! - 64,
            label: AppLocalizations.of(context)!.logIn,
            decoration: orangeGradientBtnDeco,
            onPressed: () {
              if (logInCB != null) {
                logInCB!(context);
              }
            },
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 91,
            height: 20,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 24,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color(0xccf8b518),
                  ),
                ),
                const SizedBox(width: 3),
                const Text(
                  "Atau",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 3),
                Container(
                  width: 24,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color(0xccf8b518),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          CustomButton(
            width: screenWidth! - 64,
            label: AppLocalizations.of(context)!.registerNewAccount,
            decoration: whiteFadedBtnDeco,
            textColor: const Color(themeOrange),
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
