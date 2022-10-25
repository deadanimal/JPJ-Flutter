import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/controller/popup_input_controller.dart';
import 'package:jpj_info/controller/prompt_controller.dart';
import 'package:jpj_info/controller/road_tax_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/vehicle_info_response.dart';
import 'package:jpj_info/model/vehicle_info_save_request.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/vehicleList/vehicle_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class VehicleListController extends StatefulWidget {
  const VehicleListController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VehicleListController();
}

class _VehicleListController extends State<VehicleListController> {
  late Map<String, String> vehicleNumber;
  late List<MaklumatKenderaan> vehicleInfo = [];
  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 250),
      _getVehicleList,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> numbers = [];
    for (var el in vehicleInfo) {
      numbers.add(el.noKenderaan!);
    }
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: VehicleList(
            pageTitle: AppLocalizations.of(context)!.vehicleListNumber,
            vehiclesNumber: numbers,
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
    PopupInputController(ctx: context).show(
      AppLocalizations.of(context)!.addVehicle,
      _addVehicle,
    );
  }

  void _addVehicle(String plateNumber) {
    SiteConfig conf = SiteConfig();
    VehicleInfoSaveReq req = VehicleInfoSaveReq(
      nokp: MyJPJAccountManager().id,
      nokenderaan: plateNumber,
    );
    jpjHttpRequest(
      context,
      Uri.parse(conf.vehicleInfo),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: (http.Response response) {
        _getVehicleList();
      },
    );
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
    String? id;
    for (var el in vehicleInfo) {
      if (el.noKenderaan! == plateNumber) {
        id = el.id.toString();
      }
    }
    if (id != null) {
      SiteConfig conf = SiteConfig();
      jpjHttpDeleteRequest(
        context,
        Uri.parse(conf.vehicleInfo + id),
        headers: conf.formHeader,
        callback: (http.Response response) {
          _getVehicleList();
        },
      );
    }
  }

  void _checkLKM(String plateNumber) {
    RoadTaxRequestController(
      context,
      1,
      MyJPJAccountManager().id,
      plateNumber,
    );
  }

  void _getVehicleList() {
    vehicleInfo = [];
    SiteConfig conf = SiteConfig();
    jpjHttpGetRequest(
      context,
      Uri.parse(conf.vehicleInfo + MyJPJAccountManager().id),
      headers: conf.formHeader,
      callback: (http.Response response) {
        if (response.statusCode == 200) {
          try {
            VehicleInfoResponse res = VehicleInfoResponse.fromJson(
              jsonDecode(response.body),
            );
            if (res.statusCode != null && res.statusCode == "01") {
              for (var el in res.maklumatKenderaan!) {
                vehicleInfo.add(el);
              }
            }
            setState(() {});
          } catch (e) {
            setState(() {});
            // print("error");
          }
        }
      },
    );
  }
}
