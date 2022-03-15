import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/model/roadtax_status_request.dart';
import 'package:jpj_info/model/roadtax_status_response.dart';
import 'package:jpj_info/view/appBarHeader/appBarHeader.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:http/http.dart' as http;
import './result.dart';
import 'package:jpj_info/view/navbar/navbar.dart';
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
          appBar: appBarHeader(),
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
    setHeader("Lesen\nKenderaan Motor");
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
    var index = dropdownList.indexWhere((element) => element == dropdownValue);
    SiteConfig conf = SiteConfig();
    RoadTaxStatusRequest req = RoadTaxStatusRequest(
      kategori: index.toString(),
      nokp: _nric.text,
      nokenderaan: _plateNumber.text,
    );
    try {
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
              return Result(
                result: respond,
              );
            },
          ),
        );
      } else {
        _connectionError();
      }
    } catch (e) {
      _connectionError();
    }
  }

  Future<void> _connectionError() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text('Connection Error!'),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Center(
                  child: Text('Please try again.'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
