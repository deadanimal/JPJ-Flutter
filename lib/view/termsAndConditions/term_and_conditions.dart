import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsAndConditions extends StatelessWidget {
  TermsAndConditions({
    Key? key,
  }) : super(key: key);

  late String pageTitle;

  @override
  Widget build(BuildContext context) {
    pageTitle = AppLocalizations.of(context)!.tncN;
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return showFeedbackPage(context);
  }

  Widget showFeedbackPage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: pageTitle,
          ),
          _TermsAndConditions(context),
        ],
      ),
    );
  }

  Widget _TermsAndConditions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(vPaddingXL),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color(boxShadow),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.only(
              left: vPaddingXL,
              right: vPaddingXL,
            ),
            child: Padding(
              padding: const EdgeInsets.all(vPaddingXL),
              child: Text(
                pageTitle = AppLocalizations.of(context)!.tncLong,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Color(0xff8b9eb0),
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
