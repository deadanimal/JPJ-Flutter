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

class BlacklistCheck extends StatelessWidget {
  BlacklistCheck({
    Key? key,
    required this.dropdownList,
    required this.dropdownValue,
    required this.nric,
    required this.plateNumber,
    required this.submitCallback,
    required this.selectionCallback,
  }) : super(key: key);

  late List<String> dropdownList;
  late String dropdownValue;
  late TextEditingController nric;
  late TextEditingController plateNumber;
  late String pageTitle;
  late void Function(BuildContext) submitCallback;
  late Function selectionCallback;

  @override
  Widget build(BuildContext context) {
    pageTitle = AppLocalizations.of(context)!.blacklist;
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return showBlacklistPage(context);
  }

  Widget showBlacklistPage(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: pageTitle,
          ),
          Expanded(
            child: _blacklistForm(context),
          ),
        ],
      ),
    );
  }

  Widget _blacklistForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
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
            textController: nric,
            width: mediaWidth - 64,
          ),
          const SizedBox(height: vPaddingXXL),
          TextFieldForm(
            label: AppLocalizations.of(context)!.vehicleReg,
            textController: plateNumber,
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
