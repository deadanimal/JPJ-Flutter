import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/template/online_services_form.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoadTaxCheck extends StatelessWidget {
  RoadTaxCheck({
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
    pageTitle = AppLocalizations.of(context)!.lkm;
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return showRoadTaxPage(context);
  }

  Widget showRoadTaxPage(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: pageTitle,
          ),
          Expanded(
            child: _roadTaxForm(context),
          ),
        ],
      ),
    );
  }

  Widget _roadTaxForm(BuildContext context) {
    return SingleChildScrollView(
      child: ServiceForm(
        submitCallback: submitCallback,
        selectionCallback: selectionCallback,
        idTextController: nric,
        plateNumberTextController: plateNumber,
        dropdownList: dropdownList,
        dropdownValue: dropdownValue,
      ),
    );
  }
}
