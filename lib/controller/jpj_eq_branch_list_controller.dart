import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/jpj_eq_branch_info.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/jpjEqBranchList/jpj_eq_branch_list.dart';
import 'dart:math' show cos, sqrt, asin;

class JpjEqBranchListController extends StatefulWidget {
  const JpjEqBranchListController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqBranchListController();
}

class _JpjEqBranchListController extends State<JpjEqBranchListController> {
  //todo: update branch details from server
  List<JpjEqBranchInfo> transactions = [
    JpjEqBranchInfo(
      branch: "JPJ Cawangan Jempol(Bawah)",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "2.0,103.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "JPJ Cawangan Putrajaya",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "3.2,103.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "Ibu Pejabat Putrajaya",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "2.0,112.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "JPJ Negeri Sembilan (Blok A)",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "2.0,115.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "JPJ Cawangan Bangi",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "2.0,123.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "JPJ Cawangan Bangi",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "2.0,103.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "JPJ Cawangan Bangi",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "2.0,103.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "JPJ Cawangan Bangi",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "5.2,103.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "JPJ Cawangan Bangi",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "2.5,103.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "JPJ Cawangan Bangi",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "3.0,103.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "JPJ Cawangan Bangi",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "1.2,103.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "JPJ Cawangan Bangi",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "2.0,100.5",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "JPJ Cawangan Bangi",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "2.0,112.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
    JpjEqBranchInfo(
      branch: "JPJ Cawangan Bangi",
      address:
          "Unit 11, Aras bawah Bangunan Komersil PJH Persiaran Perdana, Presint 4, 62100 Putrajaya",
      coordinate: "2.0,105.1",
      faxNumber: "0388811711",
      phoneNumber: "0388811705",
      services: [
        AvailableService(
          category: "Pelbagai",
          services: [
            "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)",
            "Permohonan permit Pemandu Antarabangsa (IDP)",
            "Permohonan Pembayaran Balik Lesen Kenderaan Motor (LKM)",
            "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen Memandu Malaysia (LMM) secara online di Portal JPJ",
            "Permohonan Gantian Lesen Kenderaan Motor (LKM)\n- Kenderaan Persendirian Individu",
          ],
        ),
      ],
      waitingListCount: "",
    ),
  ];

  double currentLat = 1.857434, currentLong = 103.082021;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: JpjEqBranchList(
            backCB: _backCallback,
            branches: transactions,
            calculateDistanceFx: _calculateDistance),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _backCallback(BuildContext context) {
    Navigator.of(context).pop();
  }

  double _calculateDistance(String coordinate) {
    final splitted = coordinate.split(',');
    double lat1 = double.parse(splitted[0]);
    double lon1 = double.parse(splitted[1]);
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((currentLat - lat1) * p) / 2 +
        c(lat1 * p) * c(currentLat * p) * (1 - c((currentLong - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}
