import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/model/result_style2.dart';
import 'package:jpj_info/model/roadtax_status_request.dart';
import 'package:jpj_info/model/roadtax_status_response.dart';
import 'package:jpj_info/view/appBarHeader/custom_appbar.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:jpj_info/view/template/template_result2.dart';
import 'package:jpj_info/view/navbar/menu.dart';
import 'package:jpj_info/view/template/template_form.dart';

class RoadTaxCheck extends StatefulWidget {
  const RoadTaxCheck({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoadTax();
}

class _RoadTax extends State<RoadTaxCheck> with TemplateForm {
  List<String> dropdownList = [
    'Penduduk Tetap Malaysia',
    'Orang Awam Malaysia',
    'Anggota Polis',
    'Anggota Tentera',
    'Syarikat/Pertubuhan',
    'Bukan Warganegara Malaysia'
  ];
  String dropdownValue = 'Penduduk Tetap Malaysia';
  String id = '';
  late TextEditingController _nric;
  late TextEditingController _plateNumber;
  String pageTitle = "Lesen\nKenderaan Motor";

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
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          endDrawer: const NavBar(),
          appBar: const CustomAppBar(
            decor: customGradient,
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
      nricTextController: _nric,
      textInput: id,
      submitCB: _submitCB,
      dropdownList: dropdownList,
      plateTextController: _plateNumber,
    );
    return Material(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: pageTitle,
          ),
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
    var index = dropdownList.indexWhere((element) => element == dropdownValue);
    SiteConfig conf = SiteConfig();
    RoadTaxStatusRequest req = RoadTaxStatusRequest(
      kategori: index.toString(),
      nokp: _nric.text,
      nokenderaan: _plateNumber.text,
    );
    try {
      EasyLoading.show(
        status: 'Please wait...',
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
              respond.lkm?.forEach((el) {
                dataSet.add(
                  Result2(
                    result: _resultField(el),
                    title: el.velinsuran,
                  ),
                );
              });

              ResultStyle2 result = ResultStyle2(
                id: respond.nokp,
                name: respond.nama,
                results: dataSet,
                subtitle: "Keputusan Carian",
                title: pageTitle,
                vehicalRegNumber: respond.nokenderaan,
              );
              return TemplateResult2(
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

  Widget _resultField(Lkm el) {
    return Padding(
      padding: const EdgeInsets.all(verticalPadding),
      child: Column(
        children: [
          const Text(
            "Tarikh Luput",
            textAlign: TextAlign.center,
            style: TextStyle(
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
          idNumber(uiElement.nricTextController, uiElement.textInput,
              uiElement.submitCB),
          const SizedBox(height: 32),
          plateNumber(uiElement.plateTextController, uiElement.textInput,
              uiElement.submitCB),
          const SizedBox(height: 32),
          submitBtn(uiElement.submitCB),
        ],
      ),
    );
  }
}
