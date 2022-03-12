import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/mainpage/mainpage.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  double? screenHeight;
  double? screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = (MediaQuery.of(context).size.width);
    screenHeight = (MediaQuery.of(context).size.height);
    return showLoginPage(context);
  }

  Widget showLoginPage(context) {
    return Container(
      width: screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/login_bg.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          logo(context),
        ],
      ),
    );
  }

  Widget logo(context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: const Image(
                image: AssetImage("images/jpj_logo_login.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(btnShadow),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: const Color(secondaryColor3),
              ),
              width: screenWidth! / 2,
              child: const TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter valid mail id as abc@gmail.com',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(btnShadow),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: const Color(secondaryColor3),
              ),
              width: screenWidth! / 2,
              child: const TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(btnShadow),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                color: const Color(secondaryColor3),
              ),
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
                          color: Color(secondaryColor),
                          fontSize: 12,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
