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

class NewRegistration extends StatelessWidget {
  const NewRegistration({
    Key? key,
    required this.emailController,
    this.submitCB,
    required this.tncCheckedCB,
    required this.readTnc,
  }) : super(key: key);

  final TextEditingController emailController;
  final void Function(BuildContext)? submitCB;
  final String pageTitle = "Daftar\nAkaun Baru";
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
            headerTitle: pageTitle,
          ),
          const SizedBox(height: vPaddingXL),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            width: mediaWidth,
            child: Column(
              children: [
                const CustomLabel(
                  label: "No. MyKad/MyPr/MyKas",
                  fontSize: 15,
                  align: TextAlign.start,
                ),
                const SizedBox(height: vPaddingS),
                TextFieldForm(
                  textController: emailController,
                  label: "No. MyKad/MyPr/MyKas",
                  width: mediaWidth - 64,
                ),
                const SizedBox(height: vPaddingM),
                const CustomLabel(
                  label: "No. Telefon",
                  fontSize: 15,
                  align: TextAlign.start,
                ),
                const SizedBox(height: vPaddingS),
                TextFieldForm(
                  textController: emailController,
                  inputType: TextInputType.phone,
                  label: "No. Telefon",
                  width: mediaWidth - 64,
                ),
                const SizedBox(height: vPaddingM),
                const CustomLabel(
                  label: "E-mel",
                  fontSize: 15,
                  align: TextAlign.start,
                ),
                const SizedBox(height: vPaddingS),
                TextFieldForm(
                  textController: emailController,
                  inputType: TextInputType.emailAddress,
                  label: "E-mel",
                  width: mediaWidth - 64,
                ),
                const SizedBox(height: vPaddingM),
                const CustomLabel(
                  label: "Sahkan E-mel",
                  fontSize: 15,
                  align: TextAlign.start,
                ),
                const SizedBox(height: vPaddingS),
                TextFieldForm(
                  textController: emailController,
                  inputType: TextInputType.emailAddress,
                  label: "Sahkan E-mel",
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
                              const TextSpan(
                                text:
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur accumsan justo ante. Donec tincidunt vel urna at placerat. Vivamus ",
                                style: TextStyle(
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
                                text: "Selanjutnya",
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
                  label: "Hantar",
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
