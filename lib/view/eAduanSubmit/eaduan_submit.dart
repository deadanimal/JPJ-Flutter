import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';

class EaduanSubmitScreen extends StatelessWidget {
  const EaduanSubmitScreen({
    Key? key,
    required this.backBtnCallback,
  }) : super(key: key);

  final Function(BuildContext) backBtnCallback;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Container(
      width: mediaWidth,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("images/submit_image.png"),
            ),
            const SizedBox(height: vPaddingXL),
            Text(
              AppLocalizations.of(context)!.yourComplaint,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
                letterSpacing: 0.63,
              ),
            ),
            const SizedBox(height: vPaddingXL),
            Text(
              AppLocalizations.of(context)!.thankYou,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                letterSpacing: 0.63,
              ),
            ),
            const SizedBox(height: vPaddingXL),
            CustomButton(
              width: mediaWidth - 64,
              onPressed: () {
                backBtnCallback(context);
              },
              decoration: navyGradientBtnDeco,
              label: AppLocalizations.of(context)!.back,
            ),
          ],
        ),
      ),
    );
  }
}
