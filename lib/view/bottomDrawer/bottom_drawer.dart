import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/common/text_style.dart';

class CustomBottomDrawer extends StatelessWidget {
  const CustomBottomDrawer({
    Key? key,
    required this.inboxCallback,
    required this.shareAppCallback,
    required this.logoutCallback,
  }) : super(key: key);
  final Function(BuildContext) inboxCallback;
  final Function(BuildContext) shareAppCallback;
  final Function(BuildContext) logoutCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 45,
              height: 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(themeNavy),
              ),
            ),
          ),
          const SizedBox(height: vPaddingXL),
          _inbox(context),
          _shareApp(context),
          _logout(context),
        ],
      ),
    );
  }

  Widget _inbox(BuildContext context) {
    if (MyJPJAccountManager().isLoggedIn) {
      return InkWell(
        onTap: () => inboxCallback(context),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                flex: 20,
                child: SizedBox(),
              ),
              Expanded(
                flex: 30,
                child: SvgPicture.asset(
                  "images/vector/inbox_icon.svg",
                  semanticsLabel: 'Inbox Icon',
                  color: const Color(themeNavy),
                  height: 24,
                ),
              ),
              Expanded(
                flex: 30,
                child: Text(
                  AppLocalizations.of(context)!.inbox,
                  style: CustomTextStyle().paragraph(),
                ),
              ),
              const Expanded(
                flex: 20,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _shareApp(BuildContext context) {
    return InkWell(
      onTap: () => shareAppCallback(context),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 20,
              child: SizedBox(),
            ),
            Expanded(
              flex: 30,
              child: SvgPicture.asset(
                "images/vector/share_icon.svg",
                semanticsLabel: 'Share Icon',
                color: const Color(themeNavy),
                height: 24,
              ),
            ),
            Expanded(
              flex: 30,
              child: Text(
                AppLocalizations.of(context)!.shareApp,
                style: CustomTextStyle().paragraph(),
              ),
            ),
            const Expanded(
              flex: 20,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _logout(BuildContext context) {
    if (MyJPJAccountManager().isLoggedIn) {
      return InkWell(
        onTap: () => logoutCallback(context),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 20,
                child: SizedBox(),
              ),
              Expanded(
                flex: 30,
                child: SvgPicture.asset(
                  "images/vector/logout_icon.svg",
                  semanticsLabel: 'Logout Icon',
                  color: const Color(themeNavy),
                  height: 24,
                ),
              ),
              Expanded(
                flex: 30,
                child: Text(
                  AppLocalizations.of(context)!.logout,
                  style: CustomTextStyle().paragraph(),
                ),
              ),
              const Expanded(
                flex: 20,
                child: SizedBox(),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
