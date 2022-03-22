import 'package:flutter/material.dart';
import 'package:jpj_info/view/appBarHeader/appBarHeader.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/mainpage/mainpage.dart';

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
    return SingleChildScrollView(
      child: Material(
        child: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/login_bg.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              _foreground(context),
            ],
          ),
        ),
      ),
    );
    return Material(
      child: Container(
        // height: screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fill,
            image: AssetImage("images/login_bg.png"),
          ),
        ),
        child: _foreground(context),
      ),
    );
  }

  Widget _foreground(context) {
    return SizedBox(
      width: screenWidth,
      child: Column(
        children: [
          _logo(context),
          const SizedBox(height: verticalPadding),
          _loginField(context),
        ],
      ),
    );
  }

  Widget _logo(context) {
    return const Center(
      child: Image(
        image: AssetImage("images/myjpj_logo_large.png"),
      ),
    );
  }

  Widget _loginField(context) {
    return Column(
      children: [
        const Text(
          "Log Masuk",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff171f44),
            fontSize: 20,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: verticalPadding),
        SizedBox(
          width: screenWidth! - 64,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 16.0,
              shadowColor: Colors.grey,
              child: TextField(
                // controller: nricTextController,
                onSubmitted: (String value) {
                  // cbFunc();
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  fillColor: Colors.white,
                  labelText: 'ID Pengguna',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: verticalPadding),
        SizedBox(
          width: screenWidth! - 64,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 16.0,
              shadowColor: Colors.grey,
              child: TextField(
                // controller: nricTextController,
                onSubmitted: (String value) {
                  // cbFunc();
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  fillColor: Colors.white,
                  labelText: 'Kata Laluan',
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: screenWidth! - 64,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Terlupa Kata Laluan?",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: verticalPadding),
        SizedBox(
          width: screenWidth! - 64,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xfff8b518), Color(0xffc18b0e)],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SizedBox(
                        child: Text(
                          "LOGIN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: verticalPadding),
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
        const SizedBox(height: verticalPadding),
        SizedBox(
          width: screenWidth! - 64,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SizedBox(
                        child: Text(
                          "Pelawat",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffd06400),
                            fontSize: 17,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: screenWidth! - 64,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3f000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SizedBox(
                        child: Text(
                          "Daftar Akaun Baru",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffd06400),
                            fontSize: 17,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
