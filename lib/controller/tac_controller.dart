import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/forgot_password_verified_controller.dart';
import 'package:jpj_info/controller/login_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:jpj_info/view/tac/tac.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TacController extends StatefulWidget {
  const TacController({
    Key? key,
    required this.id,
    required this.tac,
  }) : super(key: key);
  final String id;
  final String tac;

  @override
  State<StatefulWidget> createState() => _TacController();
}

class _TacController extends State<TacController> {
  late TextEditingController _tac;
  @override
  void initState() {
    _tac = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _tac.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          darkBtn: true,
          iconColor: Color(themeNavy),
        ),
        body: Tac(
          submitCB: submitCallback,
          tacController: _tac,
        ),
      ),
    );
  }

  void submitCallback(BuildContext context) {
    if (_tac.text.isNotEmpty) {
      if (_tac.text == widget.tac) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ForgotPasswordVerifiedController(
                id: widget.id,
              );
            },
          ),
        );
      } else {
        TooltipInfo().showInfo(
          context,
          AppLocalizations.of(context)!.errorPleaseTryAgain,
          "",
          (c) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginController();
                },
              ),
            );
          },
        );
      }
    } else {
      TooltipInfo().showInfo(
        context,
        AppLocalizations.of(context)!.pleaseFillAllInfo,
        "",
        (c) => () {},
      );
    }
  }
}
