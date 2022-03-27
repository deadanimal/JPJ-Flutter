import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/model/license_status_request.dart';
import 'package:jpj_info/model/license_status_response.dart';
import 'package:jpj_info/model/result_style1.dart';
import 'package:jpj_info/view/appBarHeader/custom_appbar.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:http/http.dart' as http;
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/navbar/menu.dart';
import 'package:jpj_info/view/template/template_form.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:jpj_info/view/template/template_result1.dart';

class LicenseCheck extends StatefulWidget {
  const LicenseCheck({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _License();
}

class _License extends State<LicenseCheck> with TemplateForm {
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
  late TextEditingController _controller;
  String pageTitle = "Lesen\nMemandu";

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
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          endDrawer: const NavBar(),
          appBar: const CustomAppBar(
            decor: customGradient,
          ),
          body: showLicensePage(),
        ),
      ),
    );
  }

  Widget showLicensePage() {
    UiElement uiElement = UiElement(
      dropdownCbFunction: _setSelection,
      dropdownValues: dropdownValue,
      nricTextController: _controller,
      textInput: id,
      submitCB: _submitCB,
      dropdownList: dropdownList,
    );
    return Material(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: pageTitle,
          ),
          _licenseForm(uiElement),
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
    LicenseStatusRequest req = LicenseStatusRequest(
      kategori: index.toString(),
      nokp: _controller.text,
    );
    try {
      EasyLoading.show(
        status: 'Please wait...',
      );
      final response = await http.post(
        Uri.parse(conf.licenseCheckUri),
        headers: conf.jsonHeader,
        body: jsonEncode(req.toJson()),
      );
      if (response.statusCode == 200) {
        LicenseStatusResponse respond = LicenseStatusResponse.fromJson(
          jsonDecode(response.body),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              List<Result1> dataSet = [];
              respond.lesen?.forEach((el) {
                dataSet.add(
                  Result1(
                    leftTitle: "Jenis Lesen",
                    leftContent: el.jenisLesen,
                    rightTitle: "Tarikh Luput",
                    rightContent: el.tempohTamat,
                  ),
                );
              });

              ResultStyle1 resultData = ResultStyle1(
                name: respond.nama,
                id: respond.nokp,
                title: pageTitle,
                subtitle: "Keputusan Carian",
                results: dataSet,
              );
              return TemplateResult1(
                data: resultData,
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

  Widget _licenseForm(UiElement uiElement) {
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
          submitBtn(uiElement.submitCB),
        ],
      ),
    );
  }
}
