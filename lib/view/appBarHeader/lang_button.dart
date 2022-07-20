import 'package:flutter/material.dart';
import 'package:jpj_info/view/appBarHeader/lang_selector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBtn extends StatelessWidget {
  const LanguageBtn({Key? key, this.dark = false}) : super(key: key);

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        LanguageSelector().showInfo(context);
      },
      child: Image.asset(
        AppLocalizations.of(context)!.localeName == "en"
            ? "images/flag/en-flag-icon.png"
            : "images/flag/ms-flag-icon.png",
        height: 24,
      ),
    );
  }
}
