import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-branches/jpjeq_branch_controller.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-homepage/jpjeq_homepage_controller.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-info/jpjeq_info_controller.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-notification/jpjeq_notification_controller.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-transaction/jpjeq_transaction_controller.dart';

class JpjEqBottomNavController extends StatefulWidget {
  const JpjEqBottomNavController({
    Key? key,
    this.pageNumber = 0,
  }) : super(key: key);
  final int pageNumber;
  @override
  State<StatefulWidget> createState() => _JpjEqBottomNavController();
}

class _JpjEqBottomNavController extends State<JpjEqBottomNavController> {
  late List<BottomNavigationBarItem> menuList;
  int notificationCount = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _initMenuList(context);
    Color bgColor = const Color(eqBottomNav);
    Color textColor = Colors.white;
    return BottomNavigationBar(
      backgroundColor: bgColor,
      currentIndex: widget.pageNumber,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: textColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      elevation: 0,
      selectedFontSize: 13,
      unselectedFontSize: 13,
      items: menuList,
      selectedItemColor: textColor,
      onTap: (index) {
        _navCallback(index, context);
      },
    );
  }

  void _navCallback(int index, BuildContext context) {
    List<Widget> jpjEqPages = [
      const JpjEqHomepageController(),
      const JpjEqBranchController(),
      const JpjEqNotificationController(),
      const JpjEqTransactionController(),
      const JpjEqInfoController(),
    ];
    if (index != widget.pageNumber) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return jpjEqPages[index];
          },
        ),
      );
    }
  }

  BottomNavigationBarItem _navBarItem({
    required String iconPath,
    required String label,
    required String semantics,
  }) {
    return BottomNavigationBarItem(
      activeIcon: Column(
        children: [
          SvgPicture.asset(
            iconPath,
            semanticsLabel: semantics,
            color: Colors.white,
            height: 24,
          ),
          Container(
            height: 4,
            width: 24,
            padding: const EdgeInsets.all(4),
            color: const Color(eqThemeOrange),
          ),
        ],
      ),
      icon: SvgPicture.asset(
        iconPath,
        semanticsLabel: semantics,
        color: Colors.white,
        height: 24,
      ),
      label: label,
    );
  }

  void _initMenuList(BuildContext context) {
    menuList = [
      _navBarItem(
        iconPath: "images/jpjeq/bottom_nav_bar/qr-code.svg",
        label: AppLocalizations.of(context)!.scan,
        semantics: 'Imbas',
      ),
      _navBarItem(
        iconPath: "images/jpjeq/bottom_nav_bar/map.svg",
        label: AppLocalizations.of(context)!.location,
        semantics: 'location',
      ),
      _navBarItem(
        iconPath: "images/jpjeq/bottom_nav_bar/notifications.svg",
        label: AppLocalizations.of(context)!.notification,
        semantics: 'notifications',
      ),
      _navBarItem(
        iconPath: "images/jpjeq/bottom_nav_bar/ticket.svg",
        label: AppLocalizations.of(context)!.transaction,
        semantics: 'transaction',
      ),
      _navBarItem(
        iconPath: "images/jpjeq/bottom_nav_bar/information-circle.svg",
        label: AppLocalizations.of(context)!.info,
        semantics: 'information',
      ),
    ];
  }
}
