import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/id_types.dart';
import 'package:jpj_info/model/expansion_list.dart';
import 'package:jpj_info/model/license_status_request.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/summonsCheck/summon_check.dart';
import 'dart:convert';

class SummonsController extends StatefulWidget {
  const SummonsController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SummonsController();
}

class _SummonsController extends State<SummonsController> {
  late TextEditingController _controller;
  late List<String> dropdownList;
  late String dropdownValue;
  late List<CustomExpensionList> summonsList;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = MyJPJAccountManager().id;
    summonsList = [];
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
        body: SummonsCheck(
          dropdownList: dropdownList,
          dropdownValue: dropdownValue,
          selectionCallback: _setSelection,
          submitCallback: _submitCallback,
          textController: _controller,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _setSelection(String? newSelection) {
    setState(() {
      dropdownValue = newSelection!;
    });
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
      Uri.parse(conf.registrationUri),
      headers: conf.jsonHeader,
      body: jsonEncode(req.toJson()),
    );
  }
}
