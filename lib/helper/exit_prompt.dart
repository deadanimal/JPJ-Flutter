import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';

class Exitprompter {
  Future<bool> prompt(BuildContext context) async {
    bool? retVal = await showDialog<bool>(
      builder: (context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.closeApp,
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
          content: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context, true);
                    SystemNavigator.pop();
                  },
                  child: Text(
                    AppLocalizations.of(context)!.yes,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(themeNavy),
                    ),
                  ),
                ),
                const SizedBox(
                  width: vPaddingXL,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.no,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(themeNavy),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      context: context,
    );
    return retVal == true;
  }
}
