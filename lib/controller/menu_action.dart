import 'package:flutter/material.dart';
import 'package:jpj_info/controller/driving_license_controller.dart';
import 'package:jpj_info/controller/latest_registration_number_controller.dart';
import 'package:jpj_info/controller/online_transection_controller.dart';
import 'package:jpj_info/controller/road_tax_controller.dart';
import 'package:jpj_info/view/latestRegNumber/plate_number.dart';

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
        return const RoadTaxController();
      },
    ),
  );
}

void latestPlatePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const LatestRegistrationNumberController();
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
