import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/controller/menu_action.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/share_response.dart';
import 'package:jpj_info/view/appBarHeader/custom_appbar.dart';
import 'package:jpj_info/view/bottomDrawer/bottom_drawer.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBarController extends StatefulWidget implements PreferredSizeWidget {
  const AppBarController({
    Key? key,
    this.decor = const BoxDecoration(),
    this.darkBtn = false,
    this.iconColor = Colors.white,
    this.hasBackButton = true,
    this.backCb,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _AppBarController();

  @override
  final Size preferredSize; // default is 56.0
  final BoxDecoration decor;
  final bool darkBtn;
  final Color iconColor;
  final bool hasBackButton;
  final Function(BuildContext)? backCb;
}

class _AppBarController extends State<AppBarController> {
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
    Widget bottomDrawer = CustomBottomDrawer(
      inboxCallback: _inbox,
      logoutCallback: _logout,
      shareAppCallback: _shareApp,
    );
    return CustomAppBar(
      iconColor: widget.iconColor,
      darkBtn: widget.darkBtn,
      decor: widget.decor,
      bottomDrawer: bottomDrawer,
      hasBackButton: widget.hasBackButton,
      backCb: widget.backCb,
    );
  }

  void _inbox(BuildContext context) {
    inboxPage(context);
  }

  Future<void> _shareApp(BuildContext context) async {
    SiteConfig conf = SiteConfig();
    jpjHttpGetRequest(
      context,
      Uri.parse(conf.share),
      headers: conf.formHeader,
      callback: (http.Response response) async {
        if (response.statusCode == 200) {
          ShareResponse res = ShareResponse.fromJson(
            jsonDecode(response.body),
          );
          String text = "";
          if (AppLocalizations.of(context)!.localeName == "ms") {
            text = res.textMs!;
          } else {
            text = res.textEn!;
          }
          Navigator.of(context).pop();
          await FlutterShare.share(
            title: text,
            text: text,
            linkUrl: res.link,
            chooserTitle: text,
          );
        }
      },
    );
  }

  void _logout(BuildContext context) {
    MyJPJAccountManager().logOut(context);
  }
}
