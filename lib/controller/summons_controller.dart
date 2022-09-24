import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/id_types.dart';
import 'package:jpj_info/model/expansion_list.dart';
import 'package:jpj_info/model/summons_response.dart';
import 'package:jpj_info/model/summons_status_request.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:jpj_info/view/summonsCheck/summon_check.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jpj_info/view/summonsStatus/summons_status.dart';

class SummonsController extends StatefulWidget {
  const SummonsController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SummonsController();
}

class _SummonsController extends State<SummonsController> {
  late TextEditingController _controller;
  late TextEditingController _plateNumnberController;
  late List<String> dropdownList;
  late String dropdownValue;
  late List<CustomExpensionList> summonsList;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _plateNumnberController = TextEditingController();
    _controller.text = MyJPJAccountManager().id;
    summonsList = [];
  }

  @override
  void dispose() {
    _controller.dispose();
    _plateNumnberController.dispose();
    summonsList = [];
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
          plateTextController: _plateNumnberController,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _setSelection(String? newSelection) {
    dropdownValue = newSelection!;
  }

  Future<void> _submitCallback(BuildContext context) async {
    if (_controller.text.isNotEmpty &&
        _plateNumnberController.text.isNotEmpty) {
      var index =
          dropdownList.indexWhere((element) => element == dropdownValue);
      SiteConfig conf = SiteConfig();
      SummonsStatusRequest req = SummonsStatusRequest(
        nokenderaan: _plateNumnberController.text,
        kategori: index.toString(),
        nokp: _controller.text,
      );
      jpjHttpRequest(context, Uri.parse(conf.summonCheckUri),
          headers: conf.formHeader,
          body: jsonEncode(req.toJson()),
          callback: _respondHandler);
    } else {
      TooltipInfo().showInfo(
        context,
        AppLocalizations.of(context)!.errorPleaseTryAgain,
        AppLocalizations.of(context)!.pleaseFillAllInfo,
        (c) {},
      );
    }
  }

  void _respondHandler(http.Response response) {
    summonsList = [];
    if (response.statusCode == 200) {
      SummonsStatusResponse respond = SummonsStatusResponse.fromJson(
        jsonDecode(response.body),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            respond.saman?.forEach((el) {
              summonsList.add(CustomExpensionList(
                data: el,
                isSelected: false,
              ));
            });
            return SummonsStatus(
              data: summonsList,
            );
          },
        ),
      );
    } else {
      AlertController(ctx: context).connectionError();
    }
  }
}
