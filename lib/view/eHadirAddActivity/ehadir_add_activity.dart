import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/text_field_with_label.dart';
import 'package:jpj_info/view/template/template_header.dart';

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
    required this.startTime1,
    required this.endTime1,
    required this.startTime2,
    required this.endTime2,
    required this.startTime3,
    required this.endTime3,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.agenda,
    required this.datePicker,
    required this.startTimePicker,
    required this.endTimePicker,
  }) : super(key: key);
  final Function(BuildContext) submitCallback;
  final TextEditingController activityName;
  final TextEditingController noOfDays;
  final TextEditingController date;
  final TextEditingController sessionPerDay;
  final TextEditingController startTime;
  final TextEditingController endTime;
  final TextEditingController startTime1;
  final TextEditingController endTime1;
  final TextEditingController startTime2;
  final TextEditingController endTime2;
  final TextEditingController startTime3;
  final TextEditingController endTime3;
  final TextEditingController location;
  final TextEditingController latitude;
  final TextEditingController longitude;
  final TextEditingController agenda;
  final Function() datePicker;
  final Function(int) startTimePicker;
  final Function(int) endTimePicker;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            TemplateHeader(
              headerTitle: AppLocalizations.of(context)!.newActivity,
              headerTitleFontSize: 48,
            ),
            const SizedBox(height: vPaddingM),
            Container(
              width: mediaWidth - 64,
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _icon(),
                  const SizedBox(height: vPaddingXL),
                  _form(context),
                ],
              ),
            ),
          ],
        ),
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
        CustomTextFieldWithLabel(
          controller: noOfDays,
          label: AppLocalizations.of(context)!.noOfDays,
          width: mediaWidth - 64,
        ),
        CustomTextFieldWithLabel(
          controller: date,
          label: AppLocalizations.of(context)!.date,
          width: mediaWidth - 64,
          ontap: datePicker,
        ),
        CustomTextFieldWithLabel(
          controller: sessionPerDay,
          label: AppLocalizations.of(context)!.noOfSessionPerDays,
          width: mediaWidth - 64,
        ),
        const SizedBox(height: vPaddingM),
        SizedBox(
          width: mediaWidth,
          child: Text(
            "${AppLocalizations.of(context)!.session} 1",
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: vPaddingM),
        CustomTextFieldWithLabel(
          controller: startTime,
          label: AppLocalizations.of(context)!.startTime,
          width: mediaWidth - 64,
          ontap: () {
            startTimePicker(1);
          },
        ),
        CustomTextFieldWithLabel(
          controller: endTime,
          label: AppLocalizations.of(context)!.endTime,
          width: mediaWidth - 64,
          ontap: () {
            endTimePicker(1);
          },
        ),
        const SizedBox(height: vPaddingM),
        SizedBox(
          width: mediaWidth,
          child: Text(
            "${AppLocalizations.of(context)!.session} 2",
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: vPaddingM),
        CustomTextFieldWithLabel(
          controller: startTime1,
          label: AppLocalizations.of(context)!.startTime,
          width: mediaWidth - 64,
          ontap: () {
            startTimePicker(2);
          },
        ),
        CustomTextFieldWithLabel(
          controller: endTime1,
          label: AppLocalizations.of(context)!.endTime,
          width: mediaWidth - 64,
          ontap: () {
            endTimePicker(2);
          },
        ),
        const SizedBox(height: vPaddingM),
        SizedBox(
          width: mediaWidth,
          child: Text(
            "${AppLocalizations.of(context)!.session} 3",
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: vPaddingM),
        CustomTextFieldWithLabel(
          controller: startTime2,
          label: AppLocalizations.of(context)!.startTime,
          width: mediaWidth - 64,
          ontap: () {
            startTimePicker(3);
          },
        ),
        CustomTextFieldWithLabel(
          controller: endTime2,
          label: AppLocalizations.of(context)!.endTime,
          width: mediaWidth - 64,
          ontap: () {
            endTimePicker(3);
          },
        ),
        const SizedBox(height: vPaddingM),
        SizedBox(
          width: mediaWidth,
          child: Text(
            "${AppLocalizations.of(context)!.session} 4",
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(height: vPaddingM),
        CustomTextFieldWithLabel(
          controller: startTime3,
          label: AppLocalizations.of(context)!.startTime,
          width: mediaWidth - 64,
          ontap: () {
            startTimePicker(4);
          },
        ),
        CustomTextFieldWithLabel(
          controller: endTime3,
          label: AppLocalizations.of(context)!.endTime,
          width: mediaWidth - 64,
          ontap: () {
            endTimePicker(4);
          },
        ),
        CustomTextFieldWithLabel(
          controller: location,
          label: AppLocalizations.of(context)!.location,
          width: mediaWidth - 64,
        ),
        CustomTextFieldWithLabel(
          controller: latitude,
          label: AppLocalizations.of(context)!.latitude,
          width: mediaWidth - 64,
        ),
        CustomTextFieldWithLabel(
          controller: longitude,
          label: AppLocalizations.of(context)!.longitude,
          width: mediaWidth - 64,
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
