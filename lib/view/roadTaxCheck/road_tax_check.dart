import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/template/online_services_form.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RoadTaxCheck extends StatelessWidget {
  const RoadTaxCheck({
    Key? key,
    required this.dropdownList,
    required this.dropdownValue,
    required this.nric,
    required this.plateNumber,
    required this.submitCallback,
    required this.selectionCallback,
  }) : super(key: key);

  final List<String> dropdownList;
  final String dropdownValue;
  final TextEditingController nric;
  final TextEditingController plateNumber;
  final void Function(BuildContext) submitCallback;
  final Function selectionCallback;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return showRoadTaxPage(context);
  }

  Widget showRoadTaxPage(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.lkm,
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
        selectionCallback: null,
        idTextController: nric,
        plateNumberTextController: plateNumber,
        dropdownList: dropdownList,
        dropdownValue: dropdownValue,
      ),
    );
  }
}
