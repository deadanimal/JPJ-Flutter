import 'package:flutter/material.dart';
import 'package:jpj_info/model/result_style2.dart';
import 'package:jpj_info/model/roadtax_status_response.dart';
import 'package:jpj_info/view/appBarHeader/appBarHeader.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/navbar/navbar.dart';
import 'package:jpj_info/view/template/template_header.dart';

class templateResult2 extends StatelessWidget with TemplateHeader {
  templateResult2({Key? key, required this.data}) : super(key: key);

  final ResultStyle2 data;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          endDrawer: const NavBar(),
          appBar: appBarHeader(),
          body: showRoadTaxPage(context),
        ),
      ),
    );
  }

  Widget showRoadTaxPage(context) {
    setHeader(data.title!);
    return Column(
      children: [
        header(),
        const SizedBox(height: verticalPadding),
        subTitle(),
        const SizedBox(height: verticalPadding),
        if (data.id != null) resultMainInfo(),
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

  Widget displayValidResult(List<Result2>? result) {
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

  Widget displayResult(Result2 result) {
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
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(btnColor),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Padding(
              padding: const EdgeInsets.all(verticalPadding),
              child: Column(
                children: [
                  Text(
                    result.title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          result.result,
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
          const SizedBox(height: verticalPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "No Pendaftaran Kenderaan",
                style: TextStyle(
                  color: Color(secondaryColor2),
                  fontSize: 13,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                data.vehicalRegNumber!.toUpperCase(),
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
      children: [
        Padding(
          padding: const EdgeInsets.all(verticalPadding),
          child: Text(
            data.subtitle!,
            style: const TextStyle(
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
