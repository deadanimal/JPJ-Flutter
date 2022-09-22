import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/first_time_password_change_controller.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/firstTimeLogin/first_time_update_profile.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';

class FirstTimeLoginController extends StatefulWidget {
  const FirstTimeLoginController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FirstTimeLoginController();
}

class _FirstTimeLoginController extends State<FirstTimeLoginController> {
  late TextEditingController _controller;
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
    List<String> dropdownList;
    if (AppLocalizations.of(context)!.localeName == "ms") {
      dropdownList = dropdownListMs;
    } else {
      dropdownList = dropdownListEn;
    }
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: FirstTimeUpdateProfile(
          dropdownList: dropdownList,
          dd: dropdownList[0],
          submitCB: _submitCallback,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  Future<void> _submitCallback(BuildContext context) async {
    TooltipInfo().showInfo(
      context,
      AppLocalizations.of(context)!.successfullySaved,
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
  }
}
