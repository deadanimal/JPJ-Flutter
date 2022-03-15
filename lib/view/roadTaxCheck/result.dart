import 'package:flutter/material.dart';
import 'package:jpj_info/model/roadtax_status_response.dart';
import 'package:jpj_info/view/appBarHeader/appBarHeader.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/navbar/navbar.dart';
import 'package:jpj_info/view/template/template_form.dart';

class Result extends StatelessWidget with TemplateForm {
  Result({Key? key, required this.result}) : super(key: key);

  final RoadTaxStatusResponse result;

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
    setHeader("Lesen\nKenderaan Motor");
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
          child: displayValidResult(result.lkm),
        ),
      ],
    );
  }

  Widget displayValidResult(List<Lkm>? lkm) {
    if (lkm != null) {
      return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lkm.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: verticalPadding),
              displayResult(lkm[index]),
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

  Widget displayResult(Lkm lkm) {
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
                      lkm.velinsuran!,
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(verticalPadding),
              child: Column(
                children: [
                  const Text(
                    "Tarikh Luput",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(secondaryColor2),
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: horizontalPadding),
                  Text(
                    lkm.expiredate!,
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
                result.nama!,
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
                result.nokp!,
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
                result.nokenderaan!.toUpperCase(),
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
