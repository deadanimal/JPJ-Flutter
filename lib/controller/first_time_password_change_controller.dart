import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/login_controller.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/firstTimePasswordChange/first_time_password_change.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';

class FirstTimePasswordChangeController extends StatefulWidget {
  const FirstTimePasswordChangeController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FirstTimePasswordChangeController();
}

class _FirstTimePasswordChangeController
    extends State<FirstTimePasswordChangeController> {
  late TextEditingController _controller;
  late TextEditingController _confirmController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: FirstTimePasswordChange(
          passwordController: _controller,
          pwdConfirmController: _confirmController,
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
      AppLocalizations.of(context)!.pleaseLogin,
      (c) {
        Navigator.push(
          c,
          MaterialPageRoute(
            builder: (context) {
              return const LoginController();
            },
          ),
        );
      },
    );
  }
}
