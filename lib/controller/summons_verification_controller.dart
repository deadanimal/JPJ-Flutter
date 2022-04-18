import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/payment_method_controller.dart';
import 'package:jpj_info/helper/id_types.dart';
import 'package:jpj_info/model/expansion_list.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/summonsStatus/summons_status.dart';

import 'package:jpj_info/view/summonsVerification/summon_verification.dart';

class SummonsVerificationController extends StatefulWidget {
  const SummonsVerificationController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SummonsVerificationController();
}

class _SummonsVerificationController
    extends State<SummonsVerificationController> {
  late TextEditingController _controller;
  late List<String> dropdownList;
  late String dropdownValue;
  late List<CustomExpensionList> summonsList;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    summonsList = [];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dropdownList = getIdType(context);
    dropdownValue = AppLocalizations.of(context)!.malaysian;
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: SummonsVerification(
          submitCallback: _submitCallback,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _submitCallback(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const PaymentMethodController();
        },
      ),
    );
  }
}
