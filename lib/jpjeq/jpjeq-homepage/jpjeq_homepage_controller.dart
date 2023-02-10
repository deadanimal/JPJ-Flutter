import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/jpjeq-homepage/jpjeq_homepage.dart';

class JpjEqHomepageController extends StatefulWidget {
  const JpjEqHomepageController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqHomepageController();
}

class _JpjEqHomepageController extends State<JpjEqHomepageController> {
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
    return const SafeArea(
      child: Scaffold(
        body: JpjEqHomepage(),
        bottomNavigationBar: JpjEqBottomNavController(),
      ),
    );
  }
}
