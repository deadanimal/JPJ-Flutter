import 'package:flutter/material.dart';
import 'package:jpj_info/view/appBarHeader/appBarHeader.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:jpj_info/view/mainpage/mainpage.dart';
import 'package:jpj_info/view/navbar/menu.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Login();
}

// class _License extends State<LicenseCheck>
class _Login extends State<Login> {
  double? screenHeight;
  double? screenWidth;
  late TextEditingController _userId;
  late TextEditingController _userPwd;

  @override
  void initState() {
    super.initState();
    _userId = TextEditingController();
    _userPwd = TextEditingController();
  }

  @override
  void dispose() {
    _userId.dispose();
    _userPwd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = (MediaQuery.of(context).size.width);
    screenHeight = (MediaQuery.of(context).size.height);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          endDrawer: const NavBar(),
          appBar: appBarHeader(
            gradient1: 0,
            gradient2: 0,
          ),
          body: showLoginPage(context),
        ),
      ),
    );
  }

  Widget showLoginPage(context) {
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
            textController: _userId,
            label: "ID Pengguna",
            width: screenWidth! - 64,
          ),
          const SizedBox(height: 8),
          TextFieldForm(
            textController: _userId,
            label: "Kata Laluan",
            width: screenWidth! - 64,
          ),
          SizedBox(
            width: screenWidth! - 64,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
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
          const SizedBox(height: 8),
          CustomButton(
            width: screenWidth! - 64,
            label: "Log Masuk",
            decoration: orangeGradientBtnDeco,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MainPage();
                  },
                ),
              );
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
            onPressed: _logAsGuess,
          ),
          const SizedBox(height: 8),
          CustomButton(
            width: screenWidth! - 64,
            label: "Daftar Akaun Baru",
            decoration: whiteBtnDeco,
            textColor: const Color(themeOrange),
            onPressed: _newRegistration,
          ),
        ],
      ),
    );
  }

  void _login() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MainPage();
        },
      ),
    );
  }

  void _logAsGuess() {
    _login();
  }

  void _newRegistration() {
    _login();
  }
}
