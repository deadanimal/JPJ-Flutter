import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';

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
          const CustomLabel(
            label: "Log Masuk",
          ),
          const SizedBox(height: 8),
          TextFieldForm(
            textController: userId,
            label: "ID Pengguna",
            width: screenWidth! - 64,
          ),
          const SizedBox(height: 8),
          TextFieldForm(
            obscureText: true,
            textController: userPwd,
            label: "Kata Laluan",
            width: screenWidth! - 64,
          ),
          SizedBox(
            width: screenWidth! - 64,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  if (forgotPasswordCB != null) {
                    forgotPasswordCB!(context);
                  }
                },
                child: Text(
                  "Terlupa Kata Laluan?",
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
          const SizedBox(height: 8),
          CustomButton(
            width: screenWidth! - 64,
            label: "Log Masuk",
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
          const SizedBox(height: 8),
          CustomButton(
            width: screenWidth! - 64,
            label: "Pelawat",
            decoration: whiteBtnDeco,
            textColor: const Color(themeOrange),
            onPressed: () {
              if (logAsGuessCB != null) {
                logAsGuessCB!(context);
              }
            },
          ),
          const SizedBox(height: 4),
          CustomButton(
            width: screenWidth! - 64,
            label: "Daftar Akaun Baru",
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
