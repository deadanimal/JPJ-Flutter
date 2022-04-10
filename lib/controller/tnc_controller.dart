import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/termsAndConditions/term_and_conditions.dart';

class TermsAndConditionsController extends StatefulWidget {
  const TermsAndConditionsController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TermsAndConditionsController();
}

class _TermsAndConditionsController
    extends State<TermsAndConditionsController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: TermsAndConditions(),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }
}
