import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/model/result_style2.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/dropdown.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlateNumber extends StatelessWidget {
  const PlateNumber({
    Key? key,
    required this.dropdownList,
    required this.dropdownValue,
    required this.submitCallback,
    required this.selectionCallback,
    required this.data,
    required this.flagIcon,
    required this.isState,
  }) : super(key: key);

  final Iterable<String> dropdownList;
  final String dropdownValue;
  final String? flagIcon;
  final void Function(BuildContext) submitCallback;
  final Function selectionCallback;
  final ResultStyle2? data;
  final bool isState;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return showNewPlatePage(context);
  }

  Widget showNewPlatePage(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.latestNNumber,
          ),
          Expanded(
            child: _newPlateForm(context),
          ),
        ],
      ),
    );
  }

  Widget _newPlateForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: vPaddingXL),
          CustomLabel(
            label: AppLocalizations.of(context)!.state,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: vPaddingXXL),
          CustomDropdown(
            cbFunc: (newVal) {
              selectionCallback(context, newVal);
            },
            dropdownList: dropdownList,
            dropdownValue: dropdownValue,
          ),
          const SizedBox(height: vPaddingXXL),
          subTitle(context),
          displayValidResult(context, data),
        ],
      ),
    );
  }

  Widget subTitle(BuildContext context) {
    if (data != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(verticalPadding),
            child: Text(
              AppLocalizations.of(context)!.searchResult,
              style: const TextStyle(
                color: Color(themeNavy),
                fontSize: 18,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
                letterSpacing: 0.63,
              ),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget displayValidResult(
    BuildContext context,
    ResultStyle2? data,
  ) {
    List<Result2>? result;
    if (data != null) {
      result = data.results;
    }
    if (result != null && result.isNotEmpty) {
      return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: result.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: verticalPadding),
              displayResult(result![index]),
            ],
          );
        },
      );
    } else {
      return Center(
        child: isState
            ? Text(AppLocalizations.of(context)!.noLatestNumber)
            : Text(AppLocalizations.of(context)!.noRecord),
      );
    }
  }

  Widget displayResult(Result2 result) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(boxShadow),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      width: mediaWidth - 64,
      child: Row(
        children: [
          Expanded(flex: 3, child: Image(image: AssetImage(flagIcon!))),
          Expanded(
            flex: 7,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text(
                      result.title!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xff354c96),
                        fontSize: 35,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                result.result,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
