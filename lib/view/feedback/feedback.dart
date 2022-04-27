import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FeedbackForm extends StatelessWidget {
  const FeedbackForm({
    Key? key,
    required this.textController,
    required this.submitCallback,
  }) : super(key: key);

  final TextEditingController textController;
  final void Function(BuildContext) submitCallback;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return showFeedbackPage(context);
  }

  Widget showFeedbackPage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.feedback,
          ),
          _feedbackForm(context),
        ],
      ),
    );
  }

  Widget _feedbackForm(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: vPaddingXL),
          CustomLabel(
            label: AppLocalizations.of(context)!.details,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: vPaddingXXL),
          TextFieldForm(
            maxLines: 6,
            inputType: TextInputType.multiline,
            label: AppLocalizations.of(context)!.pleaseTypeHere,
            textController: textController,
            width: mediaWidth - 64,
          ),
          const SizedBox(height: vPaddingXXL),
          CustomButton(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color(btnShadow),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              color: const Color(btnColor),
            ),
            label: AppLocalizations.of(context)!.submit,
            onPressed: () {
              submitCallback(context);
            },
            width: mediaWidth - 128,
          ),
        ],
      ),
    );
  }
}
