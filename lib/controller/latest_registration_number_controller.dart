import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/latest_reg_number_request.dart';
import 'package:jpj_info/model/latest_reg_number_response.dart';
import 'package:jpj_info/model/result_style2.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:jpj_info/view/latestRegNumber/plate_number.dart';
import 'dart:convert';

class LatestRegistrationNumberController extends StatefulWidget {
  const LatestRegistrationNumberController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LatestRegistrationNumberController();
}

class _LatestRegistrationNumberController
    extends State<LatestRegistrationNumberController> {
  late Iterable<String> dropdownList;
  late String dropdownValue;
  late String? flag;
  late ResultStyle2? result;
  bool isState = false;
  Map<String, String> stateMap = {
    "JOHOR": "J",
    "KEDAH": "K",
    "LANGKAWI": "KV",
    "KELANTAN": "D",
    "MELAKA": "M",
    "NEGERI SEMBILAN": "N",
    "PAHANG": "C",
    "PULAU PINANG": "P",
    "PERAK": "A",
    "PERLIS": "R",
    "SELANGOR": "B",
    "TERENGGANU": "T",
    "KOTA KINABALU": "SA",
    "SANDAKAN": "SS",
    "KUDAT": "SK",
    "TAWAU": "ST",
    "BEAUFORT": "SB",
    "KENINGAU": "SU",
    "SANDAKAN(SM)": "SM",
    "LAHAD DATU": "SD",
    "KUCHING": "QA",
    "SIBU": "QS",
    "MIRI": "QM",
    "SRI AMAN": "QB",
    "SARIKEI": "QR",
    "BINTULU": "QT",
    "LIMBANG": "QL",
    "KOTA SAMARAHAN": "QC",
    "KAPIT": "QP",
    "MUKAH": "QS",
    "BETONG": "QB",
    "LAWAS": "QL",
    "W.P KUALA LUMPUR": "W",
    "W.P LABUAN": "L",
    "W.P PUTRAJAYA": "F",
  };
  Map<String, String> flagIcon = {
    "JOHOR": "images/flag/n1.png",
    "KEDAH": "images/flag/n2.png",
    "LANGKAWI": "images/flag/n2.png",
    "KELANTAN": "images/flag/n3.png",
    "MELAKA": "images/flag/n4.png",
    "NEGERI SEMBILAN": "images/flag/n5.png",
    "PAHANG": "images/flag/n6.png",
    "PULAU PINANG": "images/flag/n7.png",
    "PERAK": "images/flag/n8.png",
    "PERLIS": "images/flag/n9.png",
    "SELANGOR": "images/flag/n10.png",
    "TERENGGANU": "images/flag/n11.png",
    "KOTA KINABALU": "images/flag/n12.png",
    "SANDAKAN": "images/flag/n12.png",
    "KUDAT": "images/flag/n12.png",
    "TAWAU": "images/flag/n12.png",
    "BEAUFORT": "images/flag/n12.png",
    "KENINGAU": "images/flag/n12.png",
    "SANDAKAN(SM)": "images/flag/n12.png",
    "LAHAD DATU": "images/flag/n12.png",
    "KUCHING": "images/flag/n13.png",
    "SIBU": "images/flag/n13.png",
    "MIRI": "images/flag/n13.png",
    "SRI AMAN": "images/flag/n13.png",
    "SARIKEI": "images/flag/n13.png",
    "BINTULU": "images/flag/n13.png",
    "LIMBANG": "images/flag/n13.png",
    "KOTA SAMARAHAN": "images/flag/n13.png",
    "KAPIT": "images/flag/n13.png",
    "MUKAH": "images/flag/n13.png",
    "BETONG": "images/flag/n13.png",
    "LAWAS": "images/flag/n13.png",
    "W.P KUALA LUMPUR": "images/flag/n14.png",
    "W.P LABUAN": "images/flag/n15.png",
    "W.P PUTRAJAYA": "images/flag/n16.png",
  };
  @override
  void initState() {
    super.initState();
    result = null;
    flag = null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dropdownList = [AppLocalizations.of(context)!.state, ...stateMap.keys];
    dropdownValue = AppLocalizations.of(context)!.state;
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: PlateNumber(
          dropdownList: dropdownList,
          dropdownValue: dropdownValue,
          selectionCallback: _setSelection,
          submitCallback: _submitCallback,
          data: result,
          flagIcon: flag,
          isState: isState,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _setSelection(BuildContext context, String? newSelection) {
    setState(() {
      dropdownValue = newSelection!;
      if (dropdownValue != AppLocalizations.of(context)!.state) {
        flag = flagIcon[dropdownValue];
      } else {
        result = null;
        flag = null;
        isState = false;
      }
      if (dropdownValue != AppLocalizations.of(context)!.state) {
        _submitCallback(context);
      }
    });
  }

  Future<void> _submitCallback(BuildContext context) async {
    String stateSelected;
    SiteConfig conf = SiteConfig();
    LatestRegNumberRequest req = LatestRegNumberRequest(
      areaCode: stateMap[dropdownValue]!,
    );
    stateSelected = dropdownValue;
    try {
      EasyLoading.show(
        status: AppLocalizations.of(context)!.pleaseWait,
      );
      final response = await http.post(
        Uri.parse(conf.plateNumberUri),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
      );
      if (response.statusCode == 200) {
        LatestRegNumberResponse respond = LatestRegNumberResponse.fromJson(
          jsonDecode(response.body),
        );
        List<Result2> dataSet = [];
        dataSet.add(
          Result2(
            result: Padding(
              padding: const EdgeInsets.all(verticalPadding),
              child: FittedBox(
                child: Text(
                  respond.regnNo!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(themeNavy),
                    fontSize: 18,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            title: stateSelected == respond.areaName
                ? respond.areaName
                : respond.areaName == ""
                    ? respond.areaName
                    : respond.areaName!.contains("WILAYAH PERSEKUTUAN")
                        ? respond.areaName
                        : "${respond.areaName!} , $stateSelected",
          ),
        );
        setState(
          () {
            if (respond.areaName != "") {
              result = ResultStyle2(
                id: null,
                name: null,
                results: dataSet,
                subtitle: AppLocalizations.of(context)!.searchResult,
                title: AppLocalizations.of(context)!.latestNNumber,
                vehicalRegNumber: null,
              );
            } else {
              result = null;
              isState = true;
            }
          },
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
}
