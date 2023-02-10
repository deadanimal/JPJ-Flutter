import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/no_trailing_label.dart';
import 'package:jpj_info/view/form/text_field.dart';

class CustomTextFieldWithLabel extends StatelessWidget {
  const CustomTextFieldWithLabel({
    Key? key,
    required this.controller,
    required this.label,
    this.readOnly = false,
    this.minLines,
    this.maxLines,
    required this.width,
    this.ontap,
    this.endWidget = const SizedBox(),
  }) : super(key: key);
  final TextEditingController controller;
  final String label;
  final bool readOnly;
  final double width;
  final int? minLines;
  final int? maxLines;
  final Function()? ontap;
  final Widget endWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomNoTrailingLabel(
          label: label,
          fontSize: 15,
          align: TextAlign.start,
          width: width,
          endWidget: endWidget,
        ),
        const SizedBox(height: vPaddingS),
        TextFieldForm(
          minLines: minLines,
          maxLines: maxLines,
          textColor: readOnly ? Colors.grey : Colors.black,
          textController: controller,
          readOnly: readOnly,
          inputType: TextInputType.emailAddress,
          label: label,
          width: width,
          onTap: ontap,
        ),
        const SizedBox(height: vPaddingM),
      ],
    );
  }
}
