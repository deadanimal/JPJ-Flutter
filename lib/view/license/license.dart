import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/model/license_status_request.dart';
import 'package:jpj_info/model/license_status_response.dart';
import 'package:jpj_info/view/appBarHeader/appBarHeader.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:http/http.dart' as http;
import 'package:jpj_info/view/license/result.dart';
import 'package:jpj_info/view/navbar/navbar.dart';
import 'package:jpj_info/view/template/template_form.dart';

class License extends StatefulWidget {
  const License({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _License();
}

class _License extends State<License> with TemplateForm {
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
          appBar: appBarHeader(),
          body: showLicensePage(),
        ),
      ),
    );
  }

  Widget showLicensePage() {
    UiElement uiElement = UiElement(
      dropdownCbFunction: _setSelection,
      dropdownValues: dropdownValue,
      textController: _controller,
      textInput: id,
      submitCB: _submitCB,
      dropdownList: dropdownList,
    );
    setHeader("Lesen\nMemandu");
    return Material(
      child: Column(
        children: [
          header(),
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
          idNumber(uiElement.textController, uiElement.textInput,
              uiElement.submitCB),
          const SizedBox(height: 32),
          submitBtn(uiElement.submitCB),
        ],
      ),
    );
  }
}
