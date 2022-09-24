import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/result_style1.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/template/component/custom_subtitle.dart';
import 'package:jpj_info/view/template/template_form.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TemplateResult1 extends StatelessWidget with TemplateForm {
  TemplateResult1({Key? key, required this.data}) : super(key: key);

  final ResultStyle1 data;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: showResultPage(context),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  Widget showResultPage(BuildContext context) {
    return Column(
      children: [
        TemplateHeader(
          headerTitle: data.title!,
        ),
        const SizedBox(height: verticalPadding),
        subTitle(),
        const SizedBox(height: verticalPadding),
        resultMainInfo(context),
        const SizedBox(height: verticalPadding),
        const Divider(
          color: Colors.black54,
          indent: horizontalPadding,
          endIndent: horizontalPadding,
          thickness: 0.8,
        ),
        Expanded(
          child: displayValidResult(context, data.results),
        ),
      ],
    );
  }

  Widget displayValidResult(BuildContext context, List<Result1>? result) {
    if (result != null && result.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: result.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: verticalPadding),
              displayResult(result[index]),
            ],
          );
        },
      );
    } else {
      return Center(
        child: Text(AppLocalizations.of(context)!.noRecord),
      );
    }
  }

  Widget displayResult(Result1 result) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(boxShadow),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      width: 0.7 * mediaWidth,
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: const Color(btnColor),
              borderRadius: BorderRadius.circular(9),
              child: Padding(
                padding: const EdgeInsets.all(verticalPadding),
                child: Column(
                  children: [
                    Text(
                      result.leftTitle!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: horizontalPadding),
                    Text(
                      result.leftContent!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(verticalPadding),
              child: Column(
                children: [
                  Text(
                    result.rightTitle!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(themeNavy),
                      fontSize: 18,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: horizontalPadding),
                  Text(
                    result.rightContent!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(themeNavy),
                      fontSize: 13,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget resultMainInfo(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          2 * horizontalPadding,
          0,
          2 * horizontalPadding,
          0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.name,
                  style: const TextStyle(
                    color: Color(themeNavy),
                    fontSize: 13,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  data.name!,
                  style: const TextStyle(
                    color: Color(themeNavy),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: verticalPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.nricNumber,
                  style: const TextStyle(
                    color: Color(themeNavy),
                    fontSize: 13,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  data.id!,
                  style: const TextStyle(
                    color: Color(themeNavy),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget subTitle() {
    return CustomSubtitle(
      subtitle: data.subtitle!,
    );
  }
}
