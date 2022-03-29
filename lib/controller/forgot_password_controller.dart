import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/tac_controller.dart';
import 'package:jpj_info/view/forgotPassword/forgot_password.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordController extends StatefulWidget {
  const ForgotPasswordController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgotPasswordController();
}

class _ForgotPasswordController extends State<ForgotPasswordController> {
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
          darkBtn: true,
        ),
        body: ForgotPassword(
          emailController: _email,
          submitCB: submitCallback,
        ),
      ),
    );
  }

  void submitCallback(BuildContext context) {
    TooltipInfo().showInfo(
      context,
      AppLocalizations.of(context)!.tacSubmitted,
      AppLocalizations.of(context)!.checkEmail,
      (c) => _onCloseSubmitInfo(c),
    );
  }

  void _onCloseSubmitInfo(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const TacController();
        },
      ),
    );
  }
}
