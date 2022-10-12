import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/model/tnc_response.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/termsAndConditions/term_and_conditions.dart';
import 'package:http/http.dart' as http;

class TermsAndConditionsController extends StatefulWidget {
  const TermsAndConditionsController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TermsAndConditionsController();
}

class _TermsAndConditionsController
    extends State<TermsAndConditionsController> {
  List<TncResponse> res = [];
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 250),
      _getTnc,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String tnc = "";
    for (var el in res) {
      tnc += "${el.title!}\n\n${el.description!}\n\n\n";
    }
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: TermsAndConditions(
          tnc: tnc,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _getTnc() {
    SiteConfig conf = SiteConfig();
    jpjHttpGetRequest(
      context,
      Uri.parse(conf.tnc),
      headers: conf.formHeader,
      callback: (http.Response response) {
        if (response.statusCode == 200) {
          for (var el in jsonDecode(response.body)) {
            res.add(TncResponse.fromJson(el));
          }
          setState(() {});
        }
      },
    );
  }
}
