import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/template/online_services_form.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SummonsCheck extends StatelessWidget {
  const SummonsCheck({
    Key? key,
    required this.textController,
    required this.dropdownList,
    required this.dropdownValue,
    required this.submitCallback,
    required this.selectionCallback,
    required this.plateTextController,
  }) : super(key: key);

  final TextEditingController textController;
  final TextEditingController plateTextController;
  final List<String> dropdownList;
  final String dropdownValue;
  final void Function(BuildContext) submitCallback;
  final Function selectionCallback;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return _showPageContent(context);
  }

  Widget _showPageContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.ticket,
          ),
          _summonsForm(context),
        ],
      ),
    );
  }

  Widget _summonsForm(BuildContext context) {
    return ServiceForm(
      submitCallback: submitCallback,
      selectionCallback: selectionCallback,
      idTextController: textController,
      dropdownList: dropdownList,
      dropdownValue: dropdownValue,
      plateNumberTextController: plateTextController,
      plateNumberHint:
          AppLocalizations.of(context)!.enterOnlyOneRegistrationNumber,
    );
  }
}
