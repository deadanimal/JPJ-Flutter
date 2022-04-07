import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/id_types.dart';
import 'package:jpj_info/model/license_status_request.dart';
import 'package:jpj_info/model/license_status_response.dart';
import 'package:jpj_info/model/result_style1.dart';
import 'package:jpj_info/model/result_style2.dart';
import 'package:jpj_info/model/roadtax_status_request.dart';
import 'package:jpj_info/model/roadtax_status_response.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/licenseCheck/license_check.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:jpj_info/view/roadTaxCheck/road_tax_check.dart';
import 'dart:convert';
import 'package:jpj_info/view/template/template_result1.dart';
import 'package:jpj_info/view/template/template_result2.dart';

class RoadTaxController extends StatefulWidget {
  const RoadTaxController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoadTaxController();
}

class _RoadTaxController extends State<RoadTaxController> {
  late TextEditingController _nric;
  late TextEditingController _plateNumber;
  late List<String> dropdownList;
  late String dropdownValue;
  late String id;
  @override
  void initState() {
    super.initState();
    _nric = TextEditingController();
    _plateNumber = TextEditingController();
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
    id = "";
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: RoadTaxCheck(
          nric: _nric,
          plateNumber: _plateNumber,
          dropdownList: dropdownList,
          dropdownValue: dropdownValue,
          id: id,
          selectionCallback: _setSelection,
          submitCallback: _submitCallback,
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
    RoadTaxStatusRequest req = RoadTaxStatusRequest(
      kategori: index.toString(),
      nokp: _nric.text,
      nokenderaan: _plateNumber.text,
    );
    try {
      EasyLoading.show(
        status: AppLocalizations.of(context)!.pleaseWait,
      );
      final response = await http.post(
        Uri.parse(conf.roadTaxCheckUri),
        headers: conf.jsonHeader,
        body: jsonEncode(req.toJson()),
      );
      if (response.statusCode == 200) {
        RoadTaxStatusResponse respond = RoadTaxStatusResponse.fromJson(
          jsonDecode(response.body),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              List<Result2> dataSet = [];
              if (respond.lkm != null) {
                for (int i = 0; i < respond.lkm!.length; i++) {
                  if (!MyJPJAccountManager().isLoggedIn && i == 0) {
                  } else {
                    dataSet.add(
                      Result2(
                        result: _resultField(respond.lkm![i]),
                        title: respond.lkm![i].velinsuran,
                      ),
                    );
                  }
                }
              }

              ResultStyle2 result = ResultStyle2(
                id: respond.nokp,
                name: respond.nama,
                results: dataSet,
                subtitle: AppLocalizations.of(context)!.searchResult,
                title: AppLocalizations.of(context)!.lkm,
                vehicalRegNumber: respond.nokenderaan,
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
    } catch (e) {
      AlertController(ctx: context).connectionError();
    } finally {
      EasyLoading.dismiss();
    }
  }

  Widget _resultField(Lkm el) {
    return Padding(
      padding: const EdgeInsets.all(verticalPadding),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.expiryDate,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(themeNavy),
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: horizontalPadding),
          Text(
            el.expiredate!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(themeNavy),
              fontSize: 13,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
