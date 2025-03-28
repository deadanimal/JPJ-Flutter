import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/id_types.dart';
import 'package:jpj_info/model/demerit_status_request.dart';
import 'package:jpj_info/model/demerit_status_response.dart';
import 'package:jpj_info/model/result_style2.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/demeritPointsCheck/demerit_points_check.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'dart:convert';
import 'package:jpj_info/view/template/template_result2.dart';

class DemeritPointsController extends StatefulWidget {
  const DemeritPointsController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DemeritPointsController();
}

class _DemeritPointsController extends State<DemeritPointsController> {
  late TextEditingController _controller;
  late List<String> dropdownList;
  late String dropdownValue;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = MyJPJAccountManager().id;
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
        body: DemeritPointsCheck(
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
    dropdownValue = newSelection!;
  }

  void _respondHandler(http.Response response) {
    if (response.statusCode == 200) {
      DemeritStatusResponse respond = DemeritStatusResponse.fromJson(
        jsonDecode(response.body),
      );
      if (respond.status == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              List<Result2> dataSet = [];
              dataSet.add(
                Result2(
                  title: respond.kejaraPoint == "true"
                      ? AppLocalizations.of(context)!.haveDemerit
                      : AppLocalizations.of(context)!.noDemerit,
                  result: Container(),
                ),
              );

              ResultStyle2 resultData = ResultStyle2(
                name: respond.name,
                id: respond.idNo,
                title: AppLocalizations.of(context)!.demeritNPoints,
                subtitle: AppLocalizations.of(context)!.searchResult,
                results: dataSet,
                vehicalRegNumber: null,
              );
              return TemplateResult2(
                data: resultData,
              );
            },
          ),
        );
      } else {
        AlertController(ctx: context)
            .generalError(AppLocalizations.of(context)!.noRecord, () {
          Navigator.pop(context);
        });
      }
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  void _submitCallback(BuildContext context) {
    if (_controller.text.isNotEmpty) {
      var index =
          dropdownList.indexWhere((element) => element == dropdownValue);
      SiteConfig conf = SiteConfig();
      DemeritStatusRequest req = DemeritStatusRequest(
        kategori: index.toString(),
        nokp: _controller.text,
      );

      jpjHttpRequest(
        context,
        Uri.parse(conf.demeritCheckUri),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
        callback: _respondHandler,
      );
    } else {
      TooltipInfo().showInfo(
        context,
        AppLocalizations.of(context)!.errorPleaseTryAgain,
        AppLocalizations.of(context)!.pleaseFillAllInfo,
        (c) {},
      );
    }
  }
}
