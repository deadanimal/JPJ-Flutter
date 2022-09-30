import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.yes,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context, false);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.no,
                    style: const TextStyle(
                      fontSize: 12,
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
