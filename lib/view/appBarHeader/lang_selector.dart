import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jpj_info/main.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/spacing.dart';

class LanguageSelector {
  Future<String?> showInfo(
    BuildContext context,
  ) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)!.languageSetting,
          textAlign: TextAlign.center,
        ),
        alignment: Alignment.center,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                _setLocale(context, "ms");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      padding: const EdgeInsets.all(6.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(themeNavy),
                      ),
                      child: SvgPicture.asset(
                        "images/vector/setting_icon_lang.svg",
                        semanticsLabel: 'Malay Language Icon',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: horizontalPadding),
                    const Text(
                      "Bahasa Malaysia",
                      style: TextStyle(
                        color: Color(themeNavy),
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: verticalPadding,
            ),
            InkWell(
              onTap: () {
                _setLocale(context, "en");
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      padding: const EdgeInsets.all(6.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(themeNavy),
                      ),
                      child: SvgPicture.asset(
                        "images/vector/setting_icon_lang.svg",
                        semanticsLabel: 'Malay Language Icon',
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: horizontalPadding),
                    const Text(
                      "Bahasa Inggeris",
                      style: TextStyle(
                        color: Color(themeNavy),
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _setLocale(BuildContext context, String languageCode) {
    MyJpj.setLocale(context, Locale.fromSubtags(languageCode: languageCode));
    Navigator.pop(context, 'OK');
  }
}
