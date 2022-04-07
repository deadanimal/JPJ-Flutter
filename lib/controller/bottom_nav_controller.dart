import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/controller/online_transection_controller.dart';
import 'package:jpj_info/controller/user_controller.dart';
import 'package:jpj_info/view/bottomBar/bottom_bar.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class BottomNavController extends StatelessWidget {
  BottomNavController({
    Key? key,
    this.darkTheme = false,
    this.inHome = false,
    this.inMenu = false,
    this.inProfile = false,
  }) : super(key: key);

  late List<void Function(BuildContext)> callbackList;
  late List<BottomNavigationBarItem> menuList;
  bool darkTheme;
  bool inHome;
  bool inMenu;
  bool inProfile;

  @override
  Widget build(BuildContext context) {
    _initCallback();
    _initMenuList();
    return BottomBar(
      items: menuList,
      tappedCallback: _navCallback,
    );
  }

  void _navCallback(int index, BuildContext context) {
    callbackList[index](context);
  }

  void _homeNavigation(BuildContext context) {
    if (!inHome) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const MainpageController();
          },
        ),
      );
    }
  }

  void _menuNavigation(BuildContext context) {
    if (!inMenu) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const OnlineTransectionController();
          },
        ),
      );
    }
  }

  void _profileNavigation(BuildContext context) {
    if (!inProfile) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const MainpageController();
          },
        ),
      );
    }
  }

  void _initCallback() {
    if (UserController().isLoggedIn()) {
      callbackList = [
        _homeNavigation,
        _menuNavigation,
        _profileNavigation,
      ];
    } else {
      callbackList = [
        _homeNavigation,
        _menuNavigation,
        _profileNavigation,
      ];
    }
  }

  void _initMenuList() {
    Color tint;
    if (darkTheme) {
      tint = Colors.white;
    } else {
      tint = const Color(themeNavy);
    }
    if (UserController().isLoggedIn()) {
      menuList = [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "images/vector/btm_home_icon.svg",
            semanticsLabel: 'Home Icon',
            color: inHome == false ? tint : Colors.grey,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "images/vector/btm_main_menu_icon.svg",
            semanticsLabel: 'Menu Icon',
            color: inMenu == false ? tint : Colors.grey,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "images/vector/btm_profile_icon.svg",
            semanticsLabel: 'Profile Icon',
            color: inProfile == false ? tint : Colors.grey,
          ),
          label: "",
        ),
      ];
    } else {
      menuList = [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "images/vector/btm_home_icon.svg",
            semanticsLabel: 'Home Icon',
            color: inHome == false ? tint : Colors.grey,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "images/vector/btm_main_menu_icon.svg",
            semanticsLabel: 'Menu Icon',
            color: inMenu == false ? tint : Colors.grey,
          ),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "images/vector/btm_profile_icon_2.svg",
            semanticsLabel: 'Profile Icon',
            color: inProfile == false ? tint : Colors.grey,
          ),
          label: "",
        ),
      ];
    }
  }
}
