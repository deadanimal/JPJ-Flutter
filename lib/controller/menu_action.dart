import 'package:flutter/material.dart';
import 'package:jpj_info/controller/driving_license_controller.dart';
import 'package:jpj_info/controller/online_transection_controller.dart';
import 'package:jpj_info/view/latestRegNumber/plate_number.dart';
import 'package:jpj_info/view/roadTaxCheck/road_tax_check.dart';

void licensePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const DrivingLicenseController();
      },
    ),
  );
}

void roadTaxCheckPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const RoadTaxCheck();
      },
    ),
  );
}

void latestPlatePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const PlateNumber();
      },
    ),
  );
}

void onlineTransectionPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const OnlineTransectionController();
      },
    ),
  );
}
