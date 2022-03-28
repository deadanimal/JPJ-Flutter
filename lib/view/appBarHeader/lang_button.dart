import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jpj_info/view/appBarHeader/lang_selector.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBtn extends StatelessWidget {
  const LanguageBtn({Key? key, this.dark = false}) : super(key: key);

  final bool dark;

  @override
  Widget build(BuildContext context) {
    Color tint;
    if (dark) {
      tint = const Color(themeNavy);
    } else {
      tint = Colors.white;
    }
    return InkWell(
      onTap: () {
        LanguageSelector().showInfo(context);
      },
      child: SvgPicture.asset(
        AppLocalizations.of(context)!.localeName == "en"
            ? "images/vector/en_lang_icon.svg"
            : "images/vector/ms_lang_icon.svg",
        semanticsLabel: 'Language Icon',
        color: tint,
        height: 24,
      ),
    );
  }
}
