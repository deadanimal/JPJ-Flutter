import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JpjEqNumberCall extends StatelessWidget {
  const JpjEqNumberCall(
      {Key? key, required this.number, required this.counterNumber})
      : super(key: key);

  final int number;
  final int counterNumber;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _image(context),
          const SizedBox(height: 24),
          _text(context),
          const SizedBox(height: 16),
          _backButton(context),
        ],
      ),
    );
  }

  Widget _image(BuildContext context) {
    return const Image(image: AssetImage("images/jpjeq/complete.png"));
  }

  Widget _text(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          height: 2,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        children: <TextSpan>[
          TextSpan(text: AppLocalizations.of(context)!.yourNumber),
          TextSpan(
            text: " $number ",
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
          TextSpan(text: "${AppLocalizations.of(context)!.hasBeenCalled}.\n"),
          TextSpan(text: AppLocalizations.of(context)!.pleaseProceedToCounter),
          TextSpan(
            text: " $counterNumber ",
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
          TextSpan(text: "${AppLocalizations.of(context)!.forYourBusiness}.\n"),
          TextSpan(
              text:
                  AppLocalizations.of(context)!.thankyouForChoosingOurService),
        ],
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(eqThemeNavy),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              AppLocalizations.of(context)!.back,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
