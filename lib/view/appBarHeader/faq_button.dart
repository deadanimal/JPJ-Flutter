import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqBtn extends StatelessWidget {
  const FaqBtn({Key? key, this.dark = false}) : super(key: key);

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
      onTap: () async {
        if (!await launchUrl(Uri.parse(SiteConfig().faq),
            mode: LaunchMode.externalNonBrowserApplication)) {
          throw 'Could not launch $SiteConfig().faq';
        }
      },
      child: SvgPicture.asset(
        "images/vector/faq_icon.svg",
        semanticsLabel: 'Faq Icon',
        color: tint,
        height: 24,
      ),
    );
  }
}
