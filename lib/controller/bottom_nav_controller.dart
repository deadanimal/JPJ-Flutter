import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jpj_info/controller/administrative_menu_controller.dart';
import 'package:jpj_info/controller/jpj_directory_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/controller/messages_controller.dart';
import 'package:jpj_info/view/bottomBar/bottom_bar.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavController extends StatelessWidget {
  BottomNavController({
    Key? key,
    this.darkTheme = false,
    this.inHome = false,
    this.inInbox = false,
    this.inProfile = false,
    this.inDirectory = false,
  }) : super(key: key);

  late List<void Function(BuildContext)> callbackList;
  late List<BottomNavigationBarItem> menuList;
  late bool darkTheme;
  late bool inHome;
  late bool inInbox;
  late bool inDirectory;
  late bool inProfile;

  @override
  Widget build(BuildContext context) {
    _initCallback();
    _initMenuList(context);
    Color bgColor = Colors.transparent;
    Color textColor = const Color(themeNavy);
    if (darkTheme) {
      bgColor = const Color(themeNavy);
      textColor = Colors.white;
    }
    return Container(
      color: bgColor,
      child: BottomBar(
        bgColor: bgColor,
        items: menuList,
        tappedCallback: _navCallback,
        textColor: textColor,
      ),
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

  void _inboxNavigation(BuildContext context) {
    if (!inInbox) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const MessageController();
          },
        ),
      );
    }
  }

  void _directoryNavigation(BuildContext context) {
    if (!inDirectory) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const JpjDirectoryController();
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
            return const AdministrativeMenuController();
          },
        ),
      );
    }
  }

  void _initCallback() {
    callbackList = [
      _homeNavigation,
      _inboxNavigation,
      _directoryNavigation,
      _profileNavigation,
    ];
  }

  void _initMenuList(BuildContext context) {
    Color tint;
    if (darkTheme) {
      tint = Colors.white;
    } else {
      tint = const Color(themeNavy);
    }

    menuList = [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "images/vector/btm_home_icon.svg",
          semanticsLabel: 'Home Icon',
          color: inHome == false ? Colors.grey : tint,
        ),
        label: AppLocalizations.of(context)!.main,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "images/vector/btm_inbox_icon.svg",
          semanticsLabel: 'inbox Icon',
          color: inInbox == false ? Colors.grey : tint,
        ),
        label: AppLocalizations.of(context)!.inbox,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "images/vector/btm_directory_icon.svg",
          semanticsLabel: 'directory Icon',
          color: inDirectory == false ? Colors.grey : tint,
        ),
        label: AppLocalizations.of(context)!.directory,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "images/vector/btm_profile_icon_2.svg",
          semanticsLabel: 'Profile Icon',
          color: inProfile == false ? Colors.grey : tint,
        ),
        label: AppLocalizations.of(context)!.profile,
      ),
    ];
  }
}
