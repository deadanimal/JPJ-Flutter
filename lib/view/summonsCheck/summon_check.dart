import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/template/online_services_form.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SummonsCheck extends StatelessWidget {
  SummonsCheck({
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
    pageTitle = AppLocalizations.of(context)!.ticket;
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return _showPageContent();
  }

  Widget _showPageContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: pageTitle,
          ),
          _summonsForm(),
        ],
      ),
    );
  }

  Widget _summonsForm() {
    return ServiceForm(
      submitCallback: submitCallback,
      selectionCallback: selectionCallback,
      idTextController: textController,
      dropdownList: dropdownList,
      dropdownValue: dropdownValue,
    );
  }
}
