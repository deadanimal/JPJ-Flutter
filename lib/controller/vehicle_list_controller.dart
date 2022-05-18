import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/popup_input_controller.dart';
import 'package:jpj_info/controller/prompt_controller.dart';
import 'package:jpj_info/controller/road_tax_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/form/custom_button.dart';
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
            onPressNumber: _onPressNumber),
        bottomNavigationBar: BottomNavController(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onPressAdd(context);
          },
          backgroundColor: const Color(themeNavy),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _onPressAdd(BuildContext context) {
    PopupInputController(ctx: context).noDataFound(
      AppLocalizations.of(context)!.addVehicle,
      _addVehicle,
    );
  }

  void _addVehicle(String plateNumber) {
    setState(() {
      MyJPJAccountManager()
          .addVehicle(plateNumber.toUpperCase().replaceAll(' ', ''));
    });
  }

  void _onPressNumber(String number) {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                  _checkLKM(number);
                },
                decoration: navyGradientBtnDeco,
                label: AppLocalizations.of(context)!.checkLkm,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                  _promptRemoveVehicle(number);
                },
                decoration: redGradientBtnDeco,
                label: AppLocalizations.of(context)!.removeVehicle,
              ),
            ],
          ),
        );
      },
    );
  }

  void _promptRemoveVehicle(String plateNumber) {
    PromptController(ctx: context).prompt(
      AppLocalizations.of(context)!.askRemove,
      () {
        _removeVehicle(plateNumber);
        Navigator.pop(context);
      },
      () {
        Navigator.pop(context);
      },
    );
  }

  void _removeVehicle(String plateNumber) {
    setState(() {
      MyJPJAccountManager().removeVehicle(plateNumber);
    });
  }

  void _checkLKM(String plateNumber) {
    RoadTaxRequestController(
      context,
      1,
      MyJPJAccountManager().id,
      plateNumber,
    );
  }
}
