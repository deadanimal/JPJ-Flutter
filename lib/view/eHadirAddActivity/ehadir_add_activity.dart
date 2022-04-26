import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/text_field_with_label.dart';

class EhadirAddActivity extends StatelessWidget {
  const EhadirAddActivity({
    Key? key,
    required this.submitCallback,
    required this.activityName,
    required this.noOfDays,
    required this.date,
    required this.sessionPerDay,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.agenda,
  }) : super(key: key);
  final Function(BuildContext) submitCallback;
  final TextEditingController activityName;
  final TextEditingController noOfDays;
  final TextEditingController date;
  final TextEditingController sessionPerDay;
  final TextEditingController startTime;
  final TextEditingController endTime;
  final TextEditingController location;
  final TextEditingController latitude;
  final TextEditingController longitude;
  final TextEditingController agenda;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: mediaWidth - 64,
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _title(context),
              const SizedBox(height: vPaddingXL),
              _icon(),
              const SizedBox(height: vPaddingXL),
              _form(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.newActivity,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xff171f44),
        fontSize: 18,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        letterSpacing: 0.63,
      ),
    );
  }

  Widget _icon() {
    return const Image(
      image: AssetImage("images/icon/ehadir_new_activity_icon.png"),
    );
  }

  Widget _form(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldWithLabel(
          controller: activityName,
          label: AppLocalizations.of(context)!.activityName,
          width: mediaWidth - 64,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 3,
              child: CustomTextFieldWithLabel(
                controller: noOfDays,
                label: AppLocalizations.of(context)!.noOfDays,
                width: mediaWidth - 64,
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 3,
              child: CustomTextFieldWithLabel(
                controller: date,
                label: AppLocalizations.of(context)!.date,
                width: mediaWidth - 64,
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 3,
              child: CustomTextFieldWithLabel(
                controller: sessionPerDay,
                label: AppLocalizations.of(context)!.noOfSessionPerDays,
                width: mediaWidth - 64,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: CustomTextFieldWithLabel(
                controller: startTime,
                label: AppLocalizations.of(context)!.startTime,
                width: mediaWidth - 64,
              ),
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 3,
              child: CustomTextFieldWithLabel(
                controller: endTime,
                label: AppLocalizations.of(context)!.endTime,
                width: mediaWidth - 64,
              ),
            ),
            const Spacer(flex: 4),
          ],
        ),
        CustomTextFieldWithLabel(
          controller: location,
          label: AppLocalizations.of(context)!.location,
          width: mediaWidth - 64,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: CustomTextFieldWithLabel(
                controller: latitude,
                label: AppLocalizations.of(context)!.latitude,
                width: mediaWidth - 64,
              ),
            ),
            Expanded(
              flex: 5,
              child: CustomTextFieldWithLabel(
                controller: longitude,
                label: AppLocalizations.of(context)!.longitude,
                width: mediaWidth - 64,
              ),
            ),
          ],
        ),
        CustomTextFieldWithLabel(
          controller: agenda,
          label: AppLocalizations.of(context)!.agenda,
          width: mediaWidth - 64,
          minLines: 3,
          maxLines: 3,
        ),
        CustomButton(
          width: mediaWidth - 128,
          onPressed: () {
            submitCallback(context);
          },
          decoration: navyGradientBtnDeco,
          label: AppLocalizations.of(context)!.submit,
        ),
      ],
    );
  }
}
