import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/jpj_eq_service.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/jpjEqAvailableService/jpj_eq_available_service.dart';

class JpjEqAvailableServiceController extends StatefulWidget {
  const JpjEqAvailableServiceController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqAvailableServiceController();
}

class _JpjEqAvailableServiceController
    extends State<JpjEqAvailableServiceController> {
  List<JpjEqService> services = [];

  @override
  void initState() {
    super.initState();
    services.add(JpjEqService("Pelbagai", "details", false));
    services.add(JpjEqService("Pendakwaan/Semakan Saman", "details2", false));
    services.add(JpjEqService("Penguatkuasaan", "details3", false));
    services.add(JpjEqService(
        "Institut Memandu",
        "-Tempahan calon ujian bertulis/lisan\n-Tempahan Ujian Praktikal Kelas B2/B/D/DA/E/H13\n-Tempahan Ujian Amali dan Vokasional",
        false));
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
        body: JpjEqAvailableService(
          services: services,
          backBtnCallback: _backBtnCallback,
          selectionChangeCallback: _selectionChange,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _backBtnCallback(BuildContext context) {
    Navigator.pop(context);
  }

  void _selectionChange(JpjEqService selectedService, bool expanded) {
    print("object");
    setState(() {
      for (var item in services) {
        if (item == selectedService) {
          item.title += "2";
          item = JpjEqService(item.title, item.details, expanded);
        } else {
          item = JpjEqService(item.title, item.details, false);
        }
      }
    });
  }
}
