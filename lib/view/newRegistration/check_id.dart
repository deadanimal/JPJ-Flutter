import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckId extends StatelessWidget {
  const CheckId({
    Key? key,
    this.submitCB,
    required this.idController,
  }) : super(key: key);
  final TextEditingController idController;
  final void Function(BuildContext)? submitCB;

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
            header: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.regNewAcc,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: vPaddingM),
                Text(
                  AppLocalizations.of(context)!.standardMySikapId,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: vPaddingXL),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            width: mediaWidth,
            child: Column(
              children: [
                CustomLabel(
                  label: AppLocalizations.of(context)!.identification,
                  fontSize: 18,
                  align: TextAlign.start,
                ),
                const SizedBox(height: vPaddingS),
                TextFieldForm(
                  textController: idController,
                  label: AppLocalizations.of(context)!.identification,
                  width: mediaWidth - 64,
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
