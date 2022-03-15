import 'package:flutter/material.dart';
import 'package:jpj_info/view/licenseCheck/license_check.dart';
import 'package:jpj_info/view/roadTaxCheck/road_tax_check.dart';

void licensePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const LicenseCheck();
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
