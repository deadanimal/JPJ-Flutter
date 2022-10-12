import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    Key? key,
    required this.tnc,
  }) : super(key: key);

  final String tnc;

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
            headerTitle: AppLocalizations.of(context)!.tncN,
          ),
          _termsAndConditions(context),
        ],
      ),
    );
  }

  Widget _termsAndConditions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(vPaddingXL),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: SingleChildScrollView(
          child: Text(
            tnc,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: "Roboto",
            ),
          ),
        ),
      ),
    );
  }
}
