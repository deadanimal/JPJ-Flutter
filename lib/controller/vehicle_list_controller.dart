import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/vehicleList/vehicle_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VehicleListController extends StatefulWidget {
  const VehicleListController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VehicleListController();
}

class _VehicleListController extends State<VehicleListController> {
  late List<String> vehicleNumber;
  @override
  void initState() {
    vehicleNumber = MyJPJAccountManager().vehicalRegNumber;
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
          decor: customGradient,
        ),
        body: VehicleList(
          pageTitle: AppLocalizations.of(context)!.vehicleListNumber,
          vehiclesNumber: vehicleNumber,
        ),
        bottomNavigationBar: BottomNavController(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onPressAdd();
          },
          backgroundColor: const Color(themeNavy),
          child: const Icon(Icons.add),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }

  void _onPressAdd() {
    print("Hello");
  }
}
