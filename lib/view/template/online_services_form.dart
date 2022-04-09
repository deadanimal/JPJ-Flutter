import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/dropdown.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceForm extends StatelessWidget {
  const ServiceForm({
    Key? key,
    required this.submitCallback,
    required this.selectionCallback,
    required this.idTextController,
    required this.dropdownList,
    required this.dropdownValue,
    this.plateNumberTextController,
  }) : super(key: key);

  final void Function(BuildContext) submitCallback;
  final Function selectionCallback;
  final TextEditingController idTextController;
  final TextEditingController? plateNumberTextController;
  final List<String> dropdownList;
  final String dropdownValue;

  @override
  Widget build(BuildContext context) {
    List<Widget> form = idForm(context);

    if (plateNumberTextController != null) {
      form.addAll(plateNumberForm(context));
    }

    form.addAll(submitBtnForm(context));

    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: form,
      ),
    );
  }

  List<Widget> idForm(BuildContext context) {
    return [
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
        textController: idTextController,
        width: mediaWidth - 64,
      ),
    ];
  }

  List<Widget> submitBtnForm(BuildContext context) {
    return [
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
    ];
  }

  List<Widget> plateNumberForm(BuildContext context) {
    return [
      const SizedBox(height: vPaddingXXL),
      TextFieldForm(
        label: AppLocalizations.of(context)!.vehicleReg,
        textController: plateNumberTextController!,
        width: mediaWidth - 64,
      ),
    ];
  }
}
