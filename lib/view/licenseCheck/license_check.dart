import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/template/online_services_form.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LicenseCheck extends StatelessWidget {
  const LicenseCheck({
    Key? key,
    required this.textController,
    required this.dropdownList,
    required this.dropdownValue,
    required this.submitCallback,
    required this.selectionCallback,
  }) : super(key: key);

  final TextEditingController textController;
  final List<String> dropdownList;
  final String dropdownValue;
  final void Function(BuildContext) submitCallback;
  final Function selectionCallback;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return showLicensePage(context);
  }

  Widget showLicensePage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.drivingLicense,
          ),
          _licenseForm(),
        ],
      ),
    );
  }

  Widget _licenseForm() {
    return ServiceForm(
      submitCallback: submitCallback,
      selectionCallback: null,
      idTextController: textController,
      dropdownList: dropdownList,
      dropdownValue: dropdownValue,
    );
  }
}
