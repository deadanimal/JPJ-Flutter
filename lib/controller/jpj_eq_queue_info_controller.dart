import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/prompt_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/jpjEqCanceledQueue/jpj_eq_canceled_queue.dart';
import 'package:jpj_info/view/jpjEqQueueInfo/jpj_eq_queue_info.dart';

class JpjEqQueueInfoController extends StatefulWidget {
  const JpjEqQueueInfoController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqQueueInfoController();
}

class _JpjEqQueueInfoController extends State<JpjEqQueueInfoController> {
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
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: JpjEqQueueInfo(
          cancelBtnCallback: _cancelBtnCallback,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _cancelBtnCallback(BuildContext context) {
    PromptController(
      ctx: context,
      content: Text(
        AppLocalizations.of(context)!.areYouSureCancelQueue,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xff171f44),
          fontSize: 15,
        ),
      ),
    ).prompt(
      AppLocalizations.of(context)!.verification,
      () {
        Navigator.of(context).pop();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const JpjEqCanceledQueue();
            },
          ),
        );
      },
      () {
        Navigator.of(context).pop();
      },
    );
  }
}
