import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/background.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/form/text_field.dart';

class Tac extends StatelessWidget {
  Tac({
    Key? key,
    this.submitCB,
    required this.tacController,
  }) : super(key: key);

  final void Function(BuildContext)? submitCB;
  final int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 180;
  final TextEditingController tacController;

  void onEnd() {
    //timer expired handle
  }

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
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
      width: mediaWidth,
      height: mediaHeight / 2,
      child: Column(
        children: [
          CustomLabel(
            label: AppLocalizations.of(context)!.tacCode,
          ),
          const SizedBox(height: vPaddingM),
          CustomLabel(
            label: AppLocalizations.of(context)!.tacDescription,
            fontWeight: FontWeight.normal,
            fontSize: 15,
          ),
          const SizedBox(height: vPaddingM),
          TextFieldForm(
            textController: tacController,
            inputType: TextInputType.text,
            label: AppLocalizations.of(context)!.tacCode,
            width: mediaWidth - 64,
          ),
          const SizedBox(height: vPaddingXL),
          const SizedBox(height: vPaddingXL),
          const SizedBox(height: vPaddingXL),
          CustomButton(
            width: mediaWidth - 64,
            onPressed: () {
              if (submitCB != null) {
                submitCB!(context);
              }
            },
            decoration: orangeGradientBtnDeco,
            label: AppLocalizations.of(context)!.verify,
          ),
        ],
      ),
    );
  }
}
