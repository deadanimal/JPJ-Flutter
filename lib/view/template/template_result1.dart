import 'package:flutter/material.dart';
import 'package:jpj_info/model/result_style1.dart';
import 'package:jpj_info/view/appBarHeader/appBarHeader.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/navbar/menu.dart';
import 'package:jpj_info/view/template/template_form.dart';
import 'package:jpj_info/view/template/template_header.dart';

class TemplateResult1 extends StatelessWidget
    with TemplateForm, TemplateHeader {
  TemplateResult1({Key? key, required this.data}) : super(key: key);

  final ResultStyle1 data;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          endDrawer: const NavBar(),
          appBar: appBarHeader(),
          body: showResultPage(context),
        ),
      ),
    );
  }

  Widget showResultPage(context) {
    setHeader(data.title!);
    return Column(
      children: [
        header(),
        const SizedBox(height: verticalPadding),
        subTitle(),
        const SizedBox(height: verticalPadding),
        resultMainInfo(),
        const SizedBox(height: verticalPadding),
        const Divider(
          color: Colors.black54,
          indent: horizontalPadding,
          endIndent: horizontalPadding,
          thickness: 0.8,
        ),
        Expanded(
          child: displayValidResult(data.results),
        ),
      ],
    );
  }

  Widget displayValidResult(List<Result1>? result) {
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
              displayResult(result[index]),
            ],
          );
        },
      );
    } else {
      return const Center(
        child: Text("No Record Found"),
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
                        fontFamily: "Poppins",
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
                        fontFamily: "Poppins",
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
                      color: Color(secondaryColor2),
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: horizontalPadding),
                  Text(
                    result.rightContent!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(secondaryColor2),
                      fontSize: 13,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      width: 0.7 * mediaWidth,
    );
  }

  Widget resultMainInfo() {
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
              const Text(
                "Nama",
                style: TextStyle(
                  color: Color(secondaryColor2),
                  fontSize: 13,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                data.name!,
                style: const TextStyle(
                  color: Color(secondaryColor2),
                  fontSize: 13,
                ),
              ),
            ],
          ),
          const SizedBox(height: verticalPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Nombor Kad Pengenalan",
                style: TextStyle(
                  color: Color(secondaryColor2),
                  fontSize: 13,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                data.id!,
                style: const TextStyle(
                  color: Color(secondaryColor2),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget subTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: const [
        Padding(
          padding: EdgeInsets.all(verticalPadding),
          child: Text(
            "Keputusan Carian",
            style: TextStyle(
              color: Color(secondaryColor2),
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
