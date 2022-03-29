import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/login_controller.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/newRegistration/new_registration.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewRegistrationController extends StatefulWidget {
  const NewRegistrationController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewRegistrationController();
}

class _NewRegistrationController extends State<NewRegistrationController> {
  late TextEditingController _email;
  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: NewRegistration(
          readTnc: _moreTnc,
          emailController: _email,
          submitCB: submitCallback,
          tncCheckedCB: _onCheckboxChanged,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void submitCallback(BuildContext context) {
    TooltipInfo().showInfo(
      context,
      AppLocalizations.of(context)!.tempPasswordSent,
      AppLocalizations.of(context)!.checkEmail,
      (c) => _onCloseSubmitInfo(c),
    );
  }

  void _onCloseSubmitInfo(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginController();
        },
      ),
    );
  }

  void _onCheckboxChanged(bool? checked) {
    print(checked);
  }

  void _moreTnc() {
    TooltipInfo().showInfo(
      context,
      "",
      AppLocalizations.of(context)!.tncLong,
      (c) => {},
    );
  }
}
