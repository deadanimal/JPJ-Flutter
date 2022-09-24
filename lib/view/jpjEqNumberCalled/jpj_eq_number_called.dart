import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';

class JpjEqNumberCalled extends StatelessWidget {
  const JpjEqNumberCalled({
    Key? key,
    required this.backCB,
    required this.counter,
    required this.number,
  }) : super(key: key);

  final Function(BuildContext) backCB;
  final String counter;
  final String number;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: mediaWidth - 64,
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            children: [
              const Image(
                image: AssetImage("images/jpjeq_people_queue.png"),
              ),
              _centerContainer(context),
              const SizedBox(height: vPaddingXL),
              CustomButton(
                onPressed: () {
                  backCB(context);
                },
                decoration: navyGradientBtnDecoSquare,
                label: AppLocalizations.of(context)!.back,
                width: 210,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _centerContainer(BuildContext context) {
    return RoundedCornerContainer(
      cornerRadius: 8,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.yourNumber),
            Text(
              number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 86,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.hasBeenCalled,
              style: const TextStyle(
                color: Color(themeNavy),
              ),
            ),
            const SizedBox(height: vPaddingXL),
            Text(
              AppLocalizations.of(context)!.pleaseProceedTo,
              style: const TextStyle(
                color: Color(themeNavy),
              ),
            ),
            Text(
              counter,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(themeNavy),
                fontSize: 32,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.forYourBusiness,
              style: const TextStyle(
                color: Color(themeNavy),
              ),
            ),
            const SizedBox(height: vPaddingXL),
            Text(
              AppLocalizations.of(context)!.thankyouForChoosingOurService,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(themeNavy),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
