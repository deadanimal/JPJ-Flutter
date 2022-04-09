import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/result_style2.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TemplateResult2 extends StatelessWidget {
  const TemplateResult2({Key? key, required this.data}) : super(key: key);

  final ResultStyle2 data;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: showRoadTaxPage(context),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  Widget showRoadTaxPage(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: data.title!,
          ),
          const SizedBox(height: verticalPadding),
          subTitle(),
          const SizedBox(height: verticalPadding),
          if (data.id != null) resultMainInfo(context),
          const SizedBox(height: verticalPadding),
          const Divider(
            color: Colors.black54,
            indent: horizontalPadding,
            endIndent: horizontalPadding,
            thickness: 0.8,
          ),
          Column(
            children: displayValidResult(context, data.results),
          ),
          const SizedBox(height: verticalPadding),
        ],
      ),
    );
  }

  List<Widget> displayValidResult(BuildContext context, List<Result2>? result) {
    if (result != null && result.isNotEmpty) {
      List<Widget> resultData = [];
      for (var el in result) {
        resultData.add(displayResult(el));
      }
      return resultData;
    } else {
      return [
        Center(
          child: Text(AppLocalizations.of(context)!.noRecord),
        ),
      ];
    }
  }

  Widget displayResult(Result2 result) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mediaWidth - 64,
        constraints: const BoxConstraints(minHeight: 122, maxWidth: 400),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  result.title!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff354c96),
                    fontSize: 35,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            result.result,
          ],
        ),
      ),
    );
  }

  Widget resultMainInfo(BuildContext context) {
    return Padding(
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
                  fontFamily: "Poppins",
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
                  fontFamily: "Poppins",
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
          const SizedBox(height: verticalPadding),
          vehicleNumber(context),
        ],
      ),
    );
  }

  Widget vehicleNumber(BuildContext context) {
    if (data.vehicalRegNumber != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.vehicleReg,
            style: const TextStyle(
              color: Color(themeNavy),
              fontSize: 13,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            data.vehicalRegNumber!.toUpperCase(),
            style: const TextStyle(
              color: Color(themeNavy),
              fontSize: 13,
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget subTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(verticalPadding),
          child: Text(
            data.subtitle!,
            style: const TextStyle(
              color: Color(themeNavy),
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
        ),
      ],
    );
  }
}
