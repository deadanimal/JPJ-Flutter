import 'package:flutter/material.dart';
import 'package:jpj_info/controller/blacklist_controller.dart';
import 'package:jpj_info/controller/change_password_controller.dart';
import 'package:jpj_info/controller/demerit_points_contoller.dart';
import 'package:jpj_info/controller/driving_license_controller.dart';
import 'package:jpj_info/controller/feedback_controller.dart';
import 'package:jpj_info/controller/jpj_directory_controller.dart';
import 'package:jpj_info/controller/latest_registration_number_controller.dart';
import 'package:jpj_info/controller/online_transaction_controller.dart';
import 'package:jpj_info/controller/profile_update_controller.dart';
import 'package:jpj_info/controller/road_tax_controller.dart';
import 'package:jpj_info/controller/summons_controller.dart';
import 'package:jpj_info/controller/test_result_controller.dart';
import 'package:jpj_info/controller/tnc_controller.dart';
import 'package:jpj_info/controller/vehicle_list_controller.dart';

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

void onlineTransactionPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const OnlineTransactionController();
      },
    ),
  );
}

void testResultPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const TestResultController();
      },
    ),
  );
}

void blacklistPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const BlacklistController();
      },
    ),
  );
}

void demeritPointsPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const DemeritPointsController();
      },
    ),
  );
}

void feedbackPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const FeedbackController();
      },
    ),
  );
}

void tncPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const TermsAndConditionsController();
      },
    ),
  );
}

void vehicleListPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const VehicleListController();
      },
    ),
  );
}

void summonListPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const SummonsController();
      },
    ),
  );
}

void jpjDirectoryPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const JpjDirectoryController();
      },
    ),
  );
}

void changePasswordPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const ChangePasswordController();
      },
    ),
  );
}

void profileUpdatePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const ProfileUpdateController();
      },
    ),
  );
}
