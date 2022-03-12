import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/view/license/component/header.dart';
import 'package:jpj_info/view/license/component/form.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:http/http.dart' as http;
import 'package:jpj_info/view/license/result.dart';

class License extends StatefulWidget {
  const License({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _License();
}

class _License extends State<License> {
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
    return showLicensePage();
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
    return Material(
      child: Column(
        children: [
          licenseHeader(),
          licenseForm(uiElement),
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
    final response = await http.post(
      Uri.parse('http://egate.jpj.gov.my/jpjinfo-api/apps/semakstatuslesen'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nokp': _controller.text,
        'kategori': index.toString(),
        'versi': "2.0",
      }),
    );
    if (response.statusCode == 200) {
      ResponseApi respond = ResponseApi.fromJson(jsonDecode(response.body));
      print(response.body);
      print(respond);
      ResultInfo resultInfo = ResultInfo();
      resultInfo.name = respond.nama;
      resultInfo.id = respond.nokp;
      resultInfo.plateNumber = respond.nokp;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Result(
              jsonResult: resultInfo,
            );
          },
        ),
      );
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thanks!'),
            content: Text(respond.toString()),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      throw Exception('Failed to create album.');
    }
  }
}

class ResponseApi {
  late String nama;
  late String nokp;

  ResponseApi.fromJson(Map<String, dynamic> json)
      : nama = json['nama'],
        nokp = json['nokp'];
}
