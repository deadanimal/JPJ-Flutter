import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/controller/login_controller.dart';
import 'package:jpj_info/helper/fav_menu.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/model/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserType {
  visitor,
  loggedIn,
  staff,
}

class MyJPJAccountManager {
  static final MyJPJAccountManager _singleton = MyJPJAccountManager._internal();
  String id = "";
  UserType type = UserType.visitor;
  late String name;
  late String email;
  late String address;
  late String phoneNumber;
  late String state;
  late String district;
  late String postcode;
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
    vehicalRegNumber = [
      "JJJ5555",
      "JVB5131",
    ];

    FavMenu().init();

    try {
      List<String>? vehicleList =
          prefs.getStringList(LocalStorageHelper().vehicleList);
      vehicalRegNumber = vehicleList!;
    } catch (e) {
      vehicalRegNumber = [];
    }
    try {
      String? userInfo = prefs.getString(LocalStorageHelper().userLoginInfo);
      LoginResponse loginResponse = LoginResponse.fromJson(
        jsonDecode(userInfo!),
      );
      id = loginResponse.nokp!;
      name = loginResponse.nama!;
      var date = DateTime.now();
      lastLoggedIn = "${date.year}/${date.month}/${date.day}"
          " ${date.hour}:${date.minute}:${date.second}"; // .toString();
      email = loginResponse.emel!;
      phoneNumber = "";
      state = "";
      district = "";
      postcode = "";
      address = "";
      type = UserType.staff;
      isLoggedIn = true;
    } catch (e) {
      isLoggedIn = false;
    }
    try {
      String? savedLanguage = prefs.getString(LocalStorageHelper().locale);
      if (savedLanguage != null) {
        preferredLanguage = savedLanguage;
      } else {
        preferredLanguage = "ms";
      }
    } catch (e) {
      preferredLanguage = "ms";
    }
  }

  void logOut(BuildContext context) {
    id = "";
    email = "";
    lastLoggedIn = "";
    phoneNumber = "";
    phoneNumber = "";
    state = "";
    district = "";
    postcode = "";
    address = "";
    type = UserType.visitor;
    name = AppLocalizations.of(context)!.visitor;
    vehicalRegNumber.clear();
    isLoggedIn = false;
    notificationCount = 0;
    SharedPreferences.getInstance().then((pref) {
      pref.remove(LocalStorageHelper().userLoginInfo);
      pref.remove(LocalStorageHelper().vehicleList);
    });

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

  void addVehicle(String regNumber) {
    vehicalRegNumber.add(regNumber);
    SharedPreferences.getInstance().then((pref) {
      pref.setStringList(LocalStorageHelper().vehicleList, vehicalRegNumber);
    });
  }

  void removeVehicle(String regNumber) {
    vehicalRegNumber.remove(regNumber);
    SharedPreferences.getInstance().then((pref) {
      pref.setStringList(LocalStorageHelper().vehicleList, vehicalRegNumber);
    });
  }
}
