import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/jpjeq-info/jpjeq_info.dart';

class JpjEqInfoController extends StatefulWidget {
  const JpjEqInfoController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqInfoController();
}

class _JpjEqInfoController extends State<JpjEqInfoController> {
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
        body: JpjEqInfo(),
        bottomNavigationBar: JpjEqBottomNavController(pageNumber: 4),
      ),
    );
  }
}
