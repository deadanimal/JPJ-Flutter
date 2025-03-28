import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/helper/id_types.dart';
import 'package:jpj_info/model/license_status_request.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/feedback/feedback.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jpj_info/view/form/tooltip_info.dart';

class FeedbackController extends StatefulWidget {
  const FeedbackController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FeedbackController();
}

class _FeedbackController extends State<FeedbackController> {
  late TextEditingController _controller;
  late List<String> dropdownList;
  late String dropdownValue;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dropdownList = getIdType(context);
    dropdownValue = AppLocalizations.of(context)!.malaysian;
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: FeedbackForm(
          submitCallback: _submitCallback,
          textController: _controller,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _respondHandler(http.Response response) {
    if (response.statusCode == 200) {
      TooltipInfo().showInfo(
        context,
        AppLocalizations.of(context)!.yourRecord,
        AppLocalizations.of(context)!.successfullySaved,
        (c) => _onCloseSubmitInfo(c),
      );
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  Future<void> _submitCallback(BuildContext context) async {
    var index = dropdownList.indexWhere((element) => element == dropdownValue);
    SiteConfig conf = SiteConfig();
    LicenseStatusRequest req = LicenseStatusRequest(
      kategori: index.toString(),
      nokp: _controller.text,
    );

    jpjHttpRequest(
      context,
      Uri.parse(conf.licenseCheckUri),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: _respondHandler,
    );
  }

  void _onCloseSubmitInfo(BuildContext context) {
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
