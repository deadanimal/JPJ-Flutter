import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/first_time_password_change_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/security_question_request.dart';
import 'package:jpj_info/model/security_question_response.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/firstTimeLogin/first_time_update_profile.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:http/http.dart' as http;

class FirstTimeLoginController extends StatefulWidget {
  const FirstTimeLoginController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FirstTimeLoginController();
}

class _FirstTimeLoginController extends State<FirstTimeLoginController> {
  late TextEditingController _controller1;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  List<String> dropdownListMs = [
    "Siapa nama Datuk Sebelah Ibu Anda",
    "Di Bandar manakah tempat anda bersekolah Menengah",
    "Apa nama syarikat pertama anda bekerja",
    "Apa destinasi percutian kegemaran anda",
    "Apa nama pengurus pertama anda",
    "Apa nama ibu anda",
    "Di manakah tempat ibu anda di lahirkan",
    "Apa nama anak saudara pertama anda",
    "Apa nama samaran zaman kanak-kanak anda",
    "PILIHAN WARNA",
    "TEMPAT DI DUNIA MENJADI PILIHAN",
    "NAMA SAMARAN",
    "NAMA BAPA",
    "CITA-CITA SEMASA MASIH KANAK-KANAK",
    "TARIKH LAPOR DIRI KEPADA JPJ",
    "ALAMAT EMEL INDIVIDU",
    "NOMBOR TELEFON",
    "NOMBOR SURAT BERANAK"
  ];
  List<String> dropdownListEn = [
    "What is your mother side maternal grandfather name",
    "In what city was your secondary school",
    "What is the first company you have worked for",
    "What is your favourite vacation destination",
    "What was the name for your first manager",
    "What is your mother name",
    "What city was your mother born",
    "What is the name of your first nephew",
    "What was your childhood nickname",
    "FAVOURITE COLOUR",
    "FAVOURITE PLACE IN THE WORLD",
    "OTHER NICKNAME",
    "FATHER NAME",
    "AMBITION WHEN WERE YOUNG",
    "OFFICIAL REPORTING DATE TO JPJ",
    "SECONDARY E-MAIL",
    "PHONE NUMBER",
    "BIRTH CERTIFICATE NUMBER",
  ];

  late List<String> dropdownList1;
  late List<String> dropdownList2;
  late List<String> dropdownList3;
  late String dd1 = "";
  late String dd2 = "";
  late String dd3 = "";

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    dropdownList1 = [];
    dropdownList2 = [];
    dropdownList3 = [];
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _populateDropDown();
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: FirstTimeUpdateProfile(
          dd1: dd1,
          dd2: dd2,
          dd3: dd3,
          dropdownList1: dropdownList1,
          dropdownList2: dropdownList2,
          dropdownList3: dropdownList3,
          submitCB: _submitCallback,
          ddCallback: _dropdownCallback,
          ans1: _controller1,
          ans2: _controller2,
          ans3: _controller3,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _responseHandler(http.Response response) {
    if (response.statusCode == 200) {
      SecurityQuestionResponse res = SecurityQuestionResponse.fromJson(
        jsonDecode(response.body),
      );
      if (res.status != null) {
        if (res.status == "00") {
          TooltipInfo().showInfo(
            context,
            AppLocalizations.of(context)!.recordSaved,
            AppLocalizations.of(context)!.changePasswordOnNextPage,
            (c) {
              Navigator.push(
                c,
                MaterialPageRoute(
                  builder: (context) {
                    return const FirstTimePasswordChangeController();
                  },
                ),
              );
            },
          );
        } else {
          AlertController(ctx: context).generalError(
            AppLocalizations.of(context)!.errorPleaseTryAgain,
            () {
              Navigator.pop(context);
            },
          );
        }
      } else {
        AlertController(ctx: context).generalError(
          AppLocalizations.of(context)!.errorPleaseTryAgain,
          () {
            Navigator.pop(context);
          },
        );
      }
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  String getQuestionId(String question) {
    List<String> questionId = [
      "PQ1",
      "PQ2",
      "PQ3",
      "PQ4",
      "PQ5",
      "PQ6",
      "PQ7",
      "PQ8",
      "PQ9",
      "UQ1",
      "UQ2",
      "UQ3",
      "UQ4",
      "UQ5",
      "01",
      "02",
      "03",
      "04",
    ];
    List<String> tempDD;
    if (AppLocalizations.of(context)!.localeName == "ms") {
      tempDD = dropdownListMs;
    } else {
      tempDD = dropdownListEn;
    }
    return questionId[tempDD.indexOf(question)];
  }

  Future<void> _submitCallback(BuildContext context) async {
    if (_controller1.text.isNotEmpty &&
        _controller2.text.isNotEmpty &&
        _controller3.text.isNotEmpty &&
        dd1 != dd2 &&
        dd1 != dd3 &&
        dd2 != dd3) {
      SiteConfig conf = SiteConfig();
      SecurityQuestionRequest req = SecurityQuestionRequest(
        soalan1: getQuestionId(dd1),
        soalan2: getQuestionId(dd2),
        soalan3: getQuestionId(dd3),
        jawapan1: _controller1.text,
        jawapan2: _controller2.text,
        jawapan3: _controller3.text,
        nokp: MyJPJAccountManager().id,
      );
      jpjHttpRequest(
        context,
        Uri.parse(conf.securityQuestionUri),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
        callback: _responseHandler,
      );
    } else {
      TooltipInfo().showInfo(
        context,
        AppLocalizations.of(context)!.errorPleaseTryAgain,
        AppLocalizations.of(context)!.securityQuestionError,
        (c) {},
      );
    }
  }

  void _populateDropDown() {
    List<String> tempDD;
    if (AppLocalizations.of(context)!.localeName == "ms") {
      tempDD = dropdownListMs;
    } else {
      tempDD = dropdownListEn;
    }
    if (dd1 == "" && dd2 == "" && dd3 == "") {
      dd1 = tempDD[0];
      dd2 = tempDD[1];
      dd3 = tempDD[2];
    }
    for (var el in tempDD) {
      // if (el == dd1) {
      //   dropdownList1.add(el);
      // } else if (el == dd2) {
      //   dropdownList2.add(el);
      // } else if (el == dd3) {
      //   dropdownList3.add(el);
      // } else {
      dropdownList1.add(el);
      dropdownList2.add(el);
      dropdownList3.add(el);
      // }
    }
  }

  void _dropdownCallback(String? newValue, int questionNumber) {
    if (questionNumber == 1) {
      dd1 = newValue!;
    } else if (questionNumber == 2) {
      dd2 = newValue!;
    } else if (questionNumber == 3) {
      dd3 = newValue!;
    }
  }
}
