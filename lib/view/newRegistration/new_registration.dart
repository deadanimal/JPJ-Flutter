import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/checkbox.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewRegistration extends StatelessWidget {
  const NewRegistration({
    Key? key,
    required this.emailController,
    this.submitCB,
    required this.tncCheckedCB,
    required this.readTnc,
    required this.phoneController,
    required this.idController,
    required this.emailVerifyController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController idController;
  final TextEditingController emailVerifyController;
  final void Function(BuildContext)? submitCB;
  final Function(bool?)? tncCheckedCB;
  final Function() readTnc;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: _foreground(context),
    );
  }

  Widget _foreground(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.regNewAcc,
          ),
          const SizedBox(height: vPaddingXL),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            width: mediaWidth,
            child: Column(
              children: [
                CustomLabel(
                  label: AppLocalizations.of(context)!.identification,
                  fontSize: 15,
                  align: TextAlign.start,
                ),
                const SizedBox(height: vPaddingS),
                TextFieldForm(
                  textController: idController,
                  label: AppLocalizations.of(context)!.identification,
                  width: mediaWidth - 64,
                ),
                const SizedBox(height: vPaddingM),
                CustomLabel(
                  label: AppLocalizations.of(context)!.phoneNumber,
                  fontSize: 15,
                  align: TextAlign.start,
                ),
                const SizedBox(height: vPaddingS),
                TextFieldForm(
                  textController: phoneController,
                  inputType: TextInputType.phone,
                  label: AppLocalizations.of(context)!.phoneNumber,
                  width: mediaWidth - 64,
                ),
                const SizedBox(height: vPaddingM),
                CustomLabel(
                  label: AppLocalizations.of(context)!.email,
                  fontSize: 15,
                  align: TextAlign.start,
                ),
                const SizedBox(height: vPaddingS),
                TextFieldForm(
                  textController: emailController,
                  inputType: TextInputType.emailAddress,
                  label: AppLocalizations.of(context)!.email,
                  width: mediaWidth - 64,
                ),
                const SizedBox(height: vPaddingM),
                CustomLabel(
                  label: AppLocalizations.of(context)!.verifyEmail,
                  fontSize: 15,
                  align: TextAlign.start,
                ),
                const SizedBox(height: vPaddingS),
                TextFieldForm(
                  textController: emailVerifyController,
                  inputType: TextInputType.emailAddress,
                  label: AppLocalizations.of(context)!.verifyEmail,
                  width: mediaWidth - 64,
                ),
                const SizedBox(height: vPaddingXL),
                SizedBox(
                  width: mediaWidth - 64,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCheckbox(
                        stateChangeCb: tncCheckedCB,
                      ),
                      const SizedBox(width: hPaddingM),
                      SizedBox(
                        width: (mediaWidth - 64) / 2,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!.tncShort,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                              TextSpan(
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w100,
                                  color: Colors.blue,
                                ),
                                text: AppLocalizations.of(context)!.readMore,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = readTnc,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: vPaddingXL),
                CustomButton(
                  decoration: navyGradientBtnDeco,
                  label: AppLocalizations.of(context)!.submit,
                  width: (mediaWidth - 64) / 2,
                  onPressed: () {
                    if (submitCB != null) {
                      submitCB!(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
