import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jpj_info/model/license.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/license/component/header.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/model/page_size.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.result}) : super(key: key);

  final LicenseInfo result;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: showLicensePage(context),
        ),
      ),
    );
  }

  Widget showLicensePage(context) {
    return Column(
      children: [
        licenseHeader(),
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
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: result.info.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(height: verticalPadding),
                  displayResult(result.info[index]),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget displayResult(Licenses licenses) {
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
                    const Text(
                      "Jenis Lesen",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: horizontalPadding),
                    Text(
                      licenses.licenseType,
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
                    licenses.licenseExpiry,
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
                result.name,
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
                result.id,
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
