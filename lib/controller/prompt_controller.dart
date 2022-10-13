import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PromptController {
  PromptController({
    required this.ctx,
    this.content,
  });

  BuildContext ctx;
  Widget? content;

  Future<void> prompt(String label, Function okCB, Function cancelCB,
      {String okString = 'OK', String noString = ""}) {
    if (noString == "") {
      noString = AppLocalizations.of(ctx)!.cancel;
    }
    return showDialog<void>(
      context: ctx,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
            ),
          ),
          content: content,
          actions: <Widget>[
            Column(
              children: [
                CustomButton(
                  onPressed: () {
                    okCB();
                  },
                  decoration: navyGradientBtnDecoSquare,
                  label: okString,
                ),
                CustomButton(
                  onPressed: () {
                    cancelCB();
                  },
                  decoration: whiteBtnDecoSquare,
                  textColor: const Color(themeNavy),
                  label: noString,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
