import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jpj_info/controller/administrative_menu_controller.dart';
import 'package:jpj_info/controller/jpj_directory_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/controller/messages_controller.dart';
import 'package:jpj_info/helper/inbox_manager.dart';
import 'package:jpj_info/view/bottomBar/bottom_bar.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({
    Key? key,
    this.darkTheme = true,
    this.inHome = false,
    this.inInbox = false,
    this.inProfile = false,
    this.inDirectory = false,
  }) : super(key: key);

  final bool darkTheme;
  final bool inHome;
  final bool inInbox;
  final bool inDirectory;
  final bool inProfile;

  @override
  State<StatefulWidget> createState() => _BottomNavController();
}

class _BottomNavController extends State<BottomNavController> {
  late List<void Function(BuildContext)> callbackList;
  late List<BottomNavigationBarItem> menuList;
  int notificationCount = 0;

  @override
  void initState() {
    _getNotificationCount();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initCallback();
    _initMenuList(context);
    Color bgColor = Colors.transparent;
    Color textColor = const Color(themeNavy);
    if (widget.darkTheme) {
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
    if (!widget.inHome) {
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
    if (!widget.inInbox) {
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
    if (!widget.inDirectory) {
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
    if (!widget.inProfile) {
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

  void _getNotificationCount() {
    if (notificationCount != InboxManager().getNumberOfUnreadItems()) {
      notificationCount = InboxManager().getNumberOfUnreadItems();
      setState(() {});
    }
    Future.delayed(
      const Duration(milliseconds: 1000),
      _getNotificationCount,
    );
  }

  void _initMenuList(BuildContext context) {
    Color tint;
    if (widget.darkTheme) {
      tint = Colors.white;
    } else {
      tint = const Color(themeNavy);
    }

    menuList = [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "images/vector/btm_home_icon.svg",
          semanticsLabel: 'Home Icon',
          color: widget.inHome == false ? Colors.grey : tint,
        ),
        label: AppLocalizations.of(context)!.main,
      ),
      BottomNavigationBarItem(
        icon: Badge(
          showBadge: notificationCount > 0 ? true : false,
          badgeContent: Text(
            notificationCount.toString(),
            style: const TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          shape: BadgeShape.circle,
          stackFit: StackFit.passthrough,
          child: SvgPicture.asset(
            "images/vector/btm_inbox_icon.svg",
            semanticsLabel: 'inbox Icon',
            color: widget.inInbox == false ? Colors.grey : tint,
          ),
        ),
        label: AppLocalizations.of(context)!.inbox,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "images/vector/btm_directory_icon.svg",
          semanticsLabel: 'directory Icon',
          color: widget.inDirectory == false ? Colors.grey : tint,
        ),
        label: AppLocalizations.of(context)!.directory,
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "images/vector/btm_profile_icon_2.svg",
          semanticsLabel: 'Profile Icon',
          color: widget.inProfile == false ? Colors.grey : tint,
        ),
        label: AppLocalizations.of(context)!.profile,
      ),
    ];
  }
}
