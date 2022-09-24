import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';

class JpjEqQueueInfo extends StatelessWidget {
  const JpjEqQueueInfo({
    Key? key,
    required this.cancelBtnCallback,
  }) : super(key: key);

  final Function(BuildContext) cancelBtnCallback;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: mediaWidth - 32,
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _queueNumber(context),
              const SizedBox(height: verticalPadding),
              CustomButton(
                onPressed: () => cancelBtnCallback(context),
                decoration: redGradientBtnDeco,
                label: AppLocalizations.of(context)!.cancelB,
                width: 90,
              ),
              const SizedBox(height: verticalPadding),
              _currentQueue(context),
              const SizedBox(height: vPaddingXXL),
              Text(
                AppLocalizations.of(context)!.thankyouForYourPatientWaiting,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _queueNumber(BuildContext context) {
    return RoundedCornerContainer(
      width: double.infinity,
      gradient: const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xfffbb03b),
          Color(0xfff49a29),
          Color(0xffe9750b),
          Color(0xffe56700)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "2500",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 100,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: vPaddingM),
            const Text(
              "4:20 PM | 0 Hours 0 Minutes 12 Seconds",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: vPaddingM),
            const Text(
              "JPJ CAWANGAN JEMPOL (Bawah)",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: vPaddingM),
            RoundedCornerContainer(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Text(
                  "${AppLocalizations.of(context)!.session} _ _",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff171f44),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _currentQueue(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _currentQueueHeader(context),
        const SizedBox(height: vPaddingS),
        _currentQueueContent(context),
      ],
    );
  }

  Widget _currentQueueHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 90,
            decoration: navyGradientBtnDecoSquare,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.latestNQNumber,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 16,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 90,
            decoration: navyGradientBtnDecoSquare,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.waitingPosition,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 16,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 90,
            decoration: navyGradientBtnDecoSquare,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.estimatedWaitTime,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _currentQueueContent(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 90,
            decoration: whiteBtnDecoSquare,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FittedBox(
                child: Text(
                  "2488",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 16,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 90,
            decoration: whiteBtnDecoSquare,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "12",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 16,
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 90,
            decoration: whiteBtnDecoSquare,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "10${AppLocalizations.of(context)!.minutes}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
