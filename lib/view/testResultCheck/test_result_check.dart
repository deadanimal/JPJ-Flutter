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

class TestResultCheck extends StatelessWidget {
  TestResultCheck({
    Key? key,
    required this.textController,
    required this.dropdownList,
    required this.dropdownValue,
    required this.submitCallback,
    required this.selectionCallback,
  }) : super(key: key);

  late String pageTitle;
  late TextEditingController textController;
  late List<String> dropdownList;
  late String dropdownValue;
  late void Function(BuildContext) submitCallback;
  late Function selectionCallback;

  @override
  Widget build(BuildContext context) {
    pageTitle = AppLocalizations.of(context)!.testNResult;
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return showLicensePage(context);
  }

  Widget showLicensePage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: pageTitle,
          ),
          _licenseForm(context),
        ],
      ),
    );
  }

  Widget _licenseForm(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: vPaddingXL),
          CustomLabel(
            label: AppLocalizations.of(context)!.category,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: vPaddingXXL),
          CustomDropdown(
            cbFunc: selectionCallback,
            dropdownList: dropdownList,
            dropdownValue: dropdownValue,
          ),
          const SizedBox(height: vPaddingXXL),
          TextFieldForm(
            label: AppLocalizations.of(context)!.identification,
            textController: textController,
            width: mediaWidth - 64,
          ),
          const SizedBox(height: vPaddingXXL),
          CustomButton(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color(btnShadow),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              color: const Color(btnColor),
            ),
            label: AppLocalizations.of(context)!.submit,
            onPressed: () {
              submitCallback(context);
            },
            width: mediaWidth - 128,
          ),
        ],
      ),
    );
  }
}
