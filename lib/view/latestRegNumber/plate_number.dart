import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/model/latest_reg_number_request.dart';
import 'package:jpj_info/model/latest_reg_number_response.dart';
import 'package:jpj_info/model/result_style2.dart';
import 'package:jpj_info/view/appBarHeader/custom_appbar.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:jpj_info/view/template/template_result2.dart';
import 'package:jpj_info/view/navbar/menu.dart';
import 'package:jpj_info/view/template/template_form.dart';

class PlateNumber extends StatefulWidget {
  const PlateNumber({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlateNumber();
}

class _PlateNumber extends State<PlateNumber>
    with TemplateForm, TemplateHeader {
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
  late Iterable<String> dropdownList;
  String dropdownValue = 'JOHOR';
  String pageTitle = "Nombor\nKenderaan Terkini";

  @override
  void initState() {
    super.initState();
    dropdownList = stateMap.keys;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          endDrawer: const NavBar(),
          appBar: const CustomAppBar(
            decor: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(headerGradient1), Color(headerGradient2)],
              ),
            ),
          ),
          body: showRoadTaxPage(),
        ),
      ),
    );
  }

  Widget showRoadTaxPage() {
    UiElement uiElement = UiElement(
      dropdownCbFunction: _setSelection,
      dropdownValues: dropdownValue,
      nricTextController: null,
      textInput: null,
      submitCB: _submitCB,
      dropdownList: dropdownList,
      plateTextController: null,
    );
    setHeader(pageTitle);
    return Material(
      child: Column(
        children: [
          header(),
          Expanded(
            child: _roadTaxForm(uiElement),
          ),
        ],
      ),
    );
  }

  void _setSelection(String? newSelection) {
    setState(() {
      dropdownValue = newSelection!;
    });
  }

  Future<void> _submitCB() async {
    SiteConfig conf = SiteConfig();
    LatestRegNumberRequest req = LatestRegNumberRequest(
      stateCode: stateMap[dropdownValue]!,
    );
    try {
      EasyLoading.show(
        status: 'Please wait...',
      );
      final response = await http.post(
        Uri.parse(conf.plateNumberUri),
        headers: conf.jsonHeader,
        body: jsonEncode(req.toJson()),
      );
      if (response.statusCode == 200) {
        LatestRegNumberResponse respond = LatestRegNumberResponse.fromJson(
          jsonDecode(response.body),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              List<Result2> dataSet = [];
              dataSet.add(
                Result2(
                  result: Padding(
                    padding: const EdgeInsets.all(verticalPadding),
                    child: FittedBox(
                      child: Text(
                        respond.velno!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(themeNavy),
                          fontSize: 18,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  title: respond.stateName,
                ),
              );

              ResultStyle2 result = ResultStyle2(
                id: null,
                name: null,
                results: dataSet,
                subtitle: "Keputusan Carian",
                title: pageTitle,
                vehicalRegNumber: null,
              );
              return templateResult2(
                data: result,
              );
            },
          ),
        );
      } else {
        connectionError(context);
      }
    } catch (e) {
      connectionError(context);
    } finally {
      EasyLoading.dismiss();
    }
  }

  Widget _roadTaxForm(UiElement uiElement) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          label(),
          const SizedBox(height: 24),
          dropdownSelector(uiElement.dropdownCbFunction,
              uiElement.dropdownValues, uiElement.dropdownList),
          const SizedBox(height: 32),
          submitBtn(uiElement.submitCB),
        ],
      ),
    );
  }
}
