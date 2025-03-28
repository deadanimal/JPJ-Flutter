import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/id_types.dart';
import 'package:jpj_info/model/black_list_request.dart';
import 'package:jpj_info/model/black_list_response.dart';
import 'package:jpj_info/model/result_style2.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:jpj_info/view/blacklistCheck/blacklist_check.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'dart:convert';
import 'package:jpj_info/view/template/template_result2.dart';

class BlacklistController extends StatefulWidget {
  const BlacklistController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BlacklistController();
}

class _BlacklistController extends State<BlacklistController> {
  late TextEditingController _nric;
  late TextEditingController _plateNumber;
  late List<String> dropdownList;
  late String dropdownValue;
  @override
  void initState() {
    super.initState();
    _nric = TextEditingController();
    _plateNumber = TextEditingController();

    _nric.text = MyJPJAccountManager().id;
  }

  @override
  void dispose() {
    _nric.dispose();
    _plateNumber.dispose();
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
        body: BlacklistCheck(
          nric: _nric,
          plateNumber: _plateNumber,
          dropdownList: dropdownList,
          dropdownValue: dropdownValue,
          selectionCallback: _setSelection,
          submitCallback: _submitCallback,
        ),
        bottomNavigationBar: const BottomNavController(),
      ),
    );
  }

  void _setSelection(String? newSelection) {
    dropdownValue = newSelection!;
  }

  void _submitCallback(BuildContext context) {
    if (_nric.text.isNotEmpty && _plateNumber.text.isNotEmpty) {
      SiteConfig conf = SiteConfig();
      BlackListStatusRequest req = BlackListStatusRequest(
        nokp: _nric.text,
        nokenderaan: _plateNumber.text,
      );
      try {
        EasyLoading.show(
          status: AppLocalizations.of(context)!.pleaseWait,
        );
        http
            .post(
          Uri.parse(conf.blacklistCheckUri),
          headers: conf.formHeader,
          body: jsonEncode(
            req.toJson(),
          ),
        )
            .then(
          (response) {
            if (response.statusCode == 200) {
              BlackListStatusResponse respond =
                  BlackListStatusResponse.fromJson(
                jsonDecode(response.body),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    List<Result2> dataSet = [];
                    dataSet.add(
                      Result2(
                        title: respond.message,
                        result: Container(),
                      ),
                    );

                    ResultStyle2 result = ResultStyle2(
                      id: respond.icno,
                      name: null,
                      results: dataSet,
                      subtitle: AppLocalizations.of(context)!.searchResult,
                      title: AppLocalizations.of(context)!.blacklist,
                      vehicalRegNumber: respond.vehicleRegno,
                    );
                    return TemplateResult2(
                      data: result,
                    );
                  },
                ),
              );
            } else {
              AlertController(ctx: context).connectionError();
            }

            EasyLoading.dismiss();
          },
        );
      } catch (e) {
        AlertController(ctx: context).connectionError();
        EasyLoading.dismiss();
      }
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
