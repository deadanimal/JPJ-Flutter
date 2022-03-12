import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/license/component/header.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/model/page_size.dart';

class ResultInfo {
  String name = "Muhammad Bin Abu";
  String id = "000000000000";
  String plateNumber = "VAR3428";
}

class Result extends StatelessWidget {
  const Result({Key? key, required this.jsonResult}) : super(key: key);

  final ResultInfo jsonResult;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return showLicensePage();
  }

  Widget showLicensePage() {
    return Material(
      child: Column(
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
          const SizedBox(height: verticalPadding),
          displayResult(),
          const SizedBox(height: verticalPadding),
          displayResult(),
        ],
      ),
    );
  }

  // Future<void> _submitCB() async {
  //   var index = dropdownList.indexWhere((element) => element == dropdownValue);
  //   final response = await http.post(
  //     Uri.parse('http://egate.jpj.gov.my/jpjinfo-api/apps/semakstatuslesen'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'nokp': _controller.text,
  //       'kategori': index.toString(),
  //       'versi': "2.0",
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     var respond = (jsonDecode(response.body));
  //     await showDialog<void>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: const Text('Thanks!'),
  //           content: Text(respond.toString()),
  //           actions: <Widget>[
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: const Text('OK'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } else {
  //     throw Exception('Failed to create album.');
  //   }
  // }

  Widget displayResult() {
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
          Material(
            color: const Color(0xff2b388d),
            borderRadius: BorderRadius.circular(9),
            child: Padding(
              padding: const EdgeInsets.all(verticalPadding),
              child: Column(
                children: const [
                  Text(
                    "Jenis Lesen",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: horizontalPadding),
                  Text(
                    "LDL - B2",
                    textAlign: TextAlign.center,
                    style: TextStyle(
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(verticalPadding),
              child: Column(
                children: const [
                  Text(
                    "Tarikh Luput",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff171f44),
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: horizontalPadding),
                  Text(
                    "21/12/2021",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff171f44),
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
                  color: Color(0xff171f44),
                  fontSize: 13,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                jsonResult.name,
                style: const TextStyle(
                  color: Color(0xff171f44),
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
                  color: Color(0xff171f44),
                  fontSize: 13,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                jsonResult.id,
                style: const TextStyle(
                  color: Color(0xff171f44),
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
                "No. Kenderaan",
                style: TextStyle(
                  color: Color(0xff171f44),
                  fontSize: 13,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                jsonResult.plateNumber,
                style: const TextStyle(
                  color: Color(0xff171f44),
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
              color: Color(0xff171f44),
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
