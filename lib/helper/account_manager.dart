import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/controller/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyJPJAccountManager {
  static final MyJPJAccountManager _singleton = MyJPJAccountManager._internal();
  String id = "";
  late String name;
  late String email;
  late String lastLoggedIn;
  List<String> vehicalRegNumber = [];
  String preferredLanguage = "en";
  bool isLoggedIn = false;
  int notificationCount = 0;

  factory MyJPJAccountManager() {
    return _singleton;
  }

  MyJPJAccountManager._internal();

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    id = "123456789012";
    name = "Sim Bin Polan";
    lastLoggedIn = "01/04/2022 10:10 PM";
    email = "simpolan@email.com";
    vehicalRegNumber = [
      "JJJ5555",
      "JVB5131",
    ];
    try {
      String? savedLanguage = await prefs.getString("locale");
      if (savedLanguage != null) {
        preferredLanguage = savedLanguage;
      } else {
        preferredLanguage = "ms";
      }
    } catch (e) {
      preferredLanguage = "ms";
    }
    isLoggedIn = true;
  }

  void logOut(BuildContext context) {
    id = "";
    email = "";
    lastLoggedIn = "";
    name = AppLocalizations.of(context)!.visitor;
    vehicalRegNumber.clear();
    isLoggedIn = false;
    notificationCount = 0;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginController();
        },
      ),
      (Route<dynamic> route) => false,
    );
  }
}
