import 'package:flutter/material.dart';
import 'package:jpj_info/view/appBarHeader/custom_appbar.dart';
import 'package:jpj_info/view/changePassword/change_password.dart';
import 'package:jpj_info/view/mainpage/mainpage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChangePasswordController extends StatefulWidget {
  const ChangePasswordController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChangePasswordController();
}

class _ChangePasswordController extends State<ChangePasswordController> {
  late TextEditingController _oldPassword;
  late TextEditingController _password;
  late TextEditingController _passwordConfirm;
  @override
  void initState() {
    super.initState();
    _oldPassword = TextEditingController();
    _password = TextEditingController();
    _passwordConfirm = TextEditingController();
  }

  @override
  void dispose() {
    _oldPassword.dispose();
    _password.dispose();
    _passwordConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: SafeArea(
        child: Scaffold(
          appBar: const CustomAppBar(
            darkBtn: true,
          ),
          body: ChangePassword(
            oldpasswordController: _oldPassword,
            passwordController: _password,
            pwdConfirmController: _passwordConfirm,
            submitCB: submitCallback,
          ),
        ),
      ),
    );
  }

  void submitCallback(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MainPage();
        },
      ),
    );
  }
}
