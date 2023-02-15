import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JpjEqChooseService extends StatelessWidget {
  JpjEqChooseService({
    Key? key,
    required this.dropdownList,
    required this.submitCallback,
    required this.selectionChange,
  }) : super(key: key);

  final List<String> dropdownList;
  final Function(String?) submitCallback;
  final Function(String?) selectionChange;
  late String selectedService = '';

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              _topIcon(context),
              const SizedBox(height: 48),
              _info(context),
              const SizedBox(height: 48),
              _serviceDropdown(context),
              const SizedBox(height: 24),
              _submitButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _info(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        AppLocalizations.of(context)!.chooseServiceInfo,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _serviceDropdown(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mediaWidth - 32,
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16, 8, 16),
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              value: dropdownList[0],
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              isExpanded: true,
              underline: Container(
                height: 2,
              ),
              onChanged: (String? val) {
                selectedService = val ?? dropdownList[0];
              },
              items: dropdownList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    overflow: TextOverflow.clip,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          submitCallback(selectedService);
        },
        child: Container(
          width: mediaWidth - 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(eqThemeNavy),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
            child: Text(
              AppLocalizations.of(context)!.submit,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
