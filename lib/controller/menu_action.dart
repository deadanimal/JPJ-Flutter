import 'package:flutter/material.dart';
import 'package:jpj_info/controller/blacklist_controller.dart';
import 'package:jpj_info/controller/change_password_controller.dart';
import 'package:jpj_info/controller/demerit_points_contoller.dart';
import 'package:jpj_info/controller/driving_license_controller.dart';
import 'package:jpj_info/controller/eaduan_form_controller.dart';
import 'package:jpj_info/controller/eaduan_menu_controller.dart';
import 'package:jpj_info/controller/ehadir_activity_info_details_controller.dart';
import 'package:jpj_info/controller/ehadir_activity_list_controller.dart';
import 'package:jpj_info/controller/ehadir_add_comittee_controller.dart';
import 'package:jpj_info/controller/ehadir_mainpage_controller.dart';
import 'package:jpj_info/controller/ehadir_menu_controller.dart';
import 'package:jpj_info/controller/ezypay_controller.dart';
import 'package:jpj_info/controller/feedback_controller.dart';
import 'package:jpj_info/controller/jpj_directory_controller.dart';
import 'package:jpj_info/controller/jpj_eq_menu_controller.dart';
import 'package:jpj_info/controller/latest_registration_number_controller.dart';
import 'package:jpj_info/controller/messagesController.dart';
import 'package:jpj_info/controller/online_transaction_controller.dart';
import 'package:jpj_info/controller/profile_update_controller.dart';
import 'package:jpj_info/controller/road_tax_controller.dart';
import 'package:jpj_info/controller/summons_controller.dart';
import 'package:jpj_info/controller/test_result_controller.dart';
import 'package:jpj_info/controller/tnc_controller.dart';
import 'package:jpj_info/controller/transaction_history_controller.dart';
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

void ezypayMenuPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const EzypayMenuController();
      },
    ),
  );
}

void inboxPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const MessageController();
      },
    ),
  );
}

void transactionHistoryPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const TransactionHistoryController();
      },
    ),
  );
}

void jpjEqMenuPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const JpjEqMenuController();
      },
    ),
  );
}

void eAduanMenuPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const EaduanMenuController();
      },
    ),
  );
}

void eAduanFormMenuPage(BuildContext context, eaduanItem item) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        return EaduanFormController(
          itemClass: item,
        );
      },
    ),
  );
}

void eHadirMenuPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const JpjEhadirMenuController();
      },
    ),
  );
}

void eHadirMainPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const EhadirMainPageController();
      },
    ),
  );
}

void eHadirActivityListPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const EhadirActivityListController();
      },
    ),
  );
}

void eHadirActivityInfoPage(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const EhadirActivityInfoDetailsController();
      },
    ),
  );
}

void eHadirAddComitteePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const EhadirAddComitteeController();
      },
    ),
  );
}
