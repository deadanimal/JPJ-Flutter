import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:jpj_info/view/common/background.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/pin.dart';

class Tac extends StatelessWidget {
  Tac({
    Key? key,
    this.screenHeight,
    this.screenWidth,
    this.submitCB,
  }) : super(key: key);

  double? screenHeight;
  double? screenWidth;
  final void Function(BuildContext, String)? submitCB;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 180;

  void onEnd() {
    //timer expired handle
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = (MediaQuery.of(context).size.width);
    screenHeight = (MediaQuery.of(context).size.height);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: Background().themeBackground(context),
      child: Center(
        child: _foreground(context),
      ),
    );
  }

  Widget _foreground(context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      width: screenWidth,
      height: screenHeight! / 2,
      child: Column(
        children: [
          const CustomLabel(
            label: "Kod TAC",
          ),
          const SizedBox(height: vPaddingM),
          const CustomLabel(
            label: "Sila masukkan kod TAC\nyang telah dihantar ke e-mel anda",
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
          const SizedBox(height: vPaddingM),
          CustomPin(
            width: screenWidth! - 64,
            submitCB: submitCB,
          ),
          SizedBox(
            width: screenWidth! - 64,
            child: CountdownTimer(
              endTime: endTime,
              onEnd: onEnd,
              widgetBuilder: (context, CurrentRemainingTime? time) {
                String countdownText;
                if (time == null) {
                  countdownText = 'Send TAC again';
                } else {
                  String minutes = time.min != null ? "${time.min}" : "0";
                  String seconds = time.sec != null ? "${time.sec}" : "00";
                  countdownText = minutes + ':' + seconds;
                }
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: Text(
                    countdownText,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                        backgroundColor: Colors.white54,
                        color: Color(0xff171f44),
                        fontSize: 10,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        shadows: [
                          BoxShadow(
                            color: Color(0xffffffff),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ]),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: vPaddingXL),
          const SizedBox(height: vPaddingXL),
          const SizedBox(height: vPaddingXL),
          CustomButton(
            width: screenWidth! - 64,
            onPressed: () {
              // if (submitCB != null) {
              //   submitCB!(context);
              // }
            },
            decoration: orangeGradientBtnDeco,
            label: "Hantar",
          ),
        ],
      ),
    );
  }
}
