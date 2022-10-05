import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/dropdown.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstTimeUpdateProfile extends StatelessWidget {
  const FirstTimeUpdateProfile({
    Key? key,
    this.submitCB,
    required this.dropdownList1,
    required this.dropdownList2,
    required this.dropdownList3,
    required this.dd1,
    required this.dd2,
    required this.dd3,
    required this.ddCallback,
    required this.ans1,
    required this.ans2,
    required this.ans3,
  }) : super(key: key);

  final void Function(BuildContext)? submitCB;
  final List<String> dropdownList1;
  final List<String> dropdownList2;
  final List<String> dropdownList3;
  final String dd1;
  final String dd2;
  final String dd3;
  final void Function(String?, int) ddCallback;
  final TextEditingController ans1;
  final TextEditingController ans2;
  final TextEditingController ans3;

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
            headerTitle: AppLocalizations.of(context)!.firstTimeLogin,
          ),
          const SizedBox(height: vPaddingXL),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            width: mediaWidth,
            child: Column(
              children: [
                CustomLabel(
                  label: AppLocalizations.of(context)!.firstQuestion,
                  fontSize: 18,
                  align: TextAlign.start,
                ),
                const SizedBox(height: vPaddingS),
                CustomDropdown(
                  cbFunc: (newVal) {
                    ddCallback(newVal, 1);
                  },
                  dropdownList: dropdownList1,
                  dropdownValue: dd1,
                ),
                const SizedBox(height: vPaddingS),
                TextFieldForm(
                  label: AppLocalizations.of(context)!.answer,
                  width: mediaWidth - 64,
                  textController: ans1,
                ),
                const SizedBox(height: vPaddingM),
                CustomLabel(
                  label: AppLocalizations.of(context)!.secondQuestion,
                  fontSize: 18,
                  align: TextAlign.start,
                ),
                const SizedBox(height: vPaddingS),
                CustomDropdown(
                  cbFunc: (newVal) {
                    ddCallback(newVal, 2);
                  },
                  dropdownList: dropdownList2,
                  dropdownValue: dd2,
                ),
                const SizedBox(height: vPaddingS),
                TextFieldForm(
                  label: AppLocalizations.of(context)!.answer,
                  width: mediaWidth - 64,
                  textController: ans2,
                ),
                const SizedBox(height: vPaddingM),
                CustomLabel(
                  label: AppLocalizations.of(context)!.thirdQuestion,
                  fontSize: 18,
                  align: TextAlign.start,
                ),
                const SizedBox(height: vPaddingS),
                CustomDropdown(
                  cbFunc: (newVal) {
                    ddCallback(newVal, 3);
                  },
                  dropdownList: dropdownList3,
                  dropdownValue: dd3,
                ),
                const SizedBox(height: vPaddingS),
                TextFieldForm(
                  label: AppLocalizations.of(context)!.answer,
                  width: mediaWidth - 64,
                  textController: ans3,
                ),
                const SizedBox(height: vPaddingM),
                CustomButton(
                  width: mediaWidth - 64,
                  label: AppLocalizations.of(context)!.next,
                  decoration: navyGradientBtnDeco,
                  onPressed: () {
                    submitCB!(context);
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
