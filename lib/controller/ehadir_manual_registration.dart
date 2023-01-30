import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/eHadirManualRegister/ehadir_manual_register.dart';

class EhadirManualRegistrationController extends StatefulWidget {
  const EhadirManualRegistrationController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EhadirManualRegistrationController();
}

class _EhadirManualRegistrationController
    extends State<EhadirManualRegistrationController> {
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
          decor: customGradient,
        ),
        body: EhadirManualRegistration(
          submitCallback: _submitCallback,
          staffNricController: staffNric,
        ),
        bottomNavigationBar: const BottomNavController(),
      ),
    );
  }

  void _submitCallback(BuildContext context) {
    // todo: add processing of input to update comittee list
    // print(staffNric.text);
    Navigator.pop(context);
  }
}
