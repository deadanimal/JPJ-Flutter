import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/eHadirAddComittee/ehadir_add_comittee.dart';

class EhadirAddComitteeController extends StatefulWidget {
  const EhadirAddComitteeController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EhadirAddComitteeController();
}

class _EhadirAddComitteeController extends State<EhadirAddComitteeController> {
  late TextEditingController staffNric;

  @override
  void initState() {
    super.initState();
    staffNric = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    staffNric.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: EhadirAddComitee(
          submitCallback: _submitCallback,
          staffNricController: staffNric,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _submitCallback(BuildContext context) {
    // todo: add processing of input to update comittee list
    // print(staffNric.text);
    Navigator.pop(context);
  }
}
