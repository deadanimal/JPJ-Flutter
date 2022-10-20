import 'package:flutter/cupertino.dart';
import 'package:jpj_info/controller/eaduan_form_controller.dart';
import 'package:jpj_info/controller/menu_action.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuList {
  MenuList({required this.ctx});
  late BuildContext ctx;

  List<CustomMenuItem> getServisMenuList() {
    return [
      CustomMenuItem(
        "JPJeBid",
        "images/icon/ebit_icon.png",
        jpjEbidStore,
        id: 1,
      ),
      CustomMenuItem(
        "JPJeQ",
        "images/icon/jpjeq_icon.png",
        jpjEqMenuPage,
        login: true,
        id: 2,
      ),
      CustomMenuItem(
        "e-Aduan\n@JPJ",
        "images/icon/eaduan_icon.png",
        eAduanMenuPage,
        login: true,
        id: 3,
      ),
      // CustomMenuItem(
      //   "EzyPay",
      //   "images/icon/ezypay_icon.png",
      //   ezypayMenuPage,
      //   login: true,
      //   id: 4,
      // ),
      // CustomMenuItem(
      //   AppLocalizations.of(ctx)!.onlineTransaction,
      //   "images/icon/online_transaction_icon.png",
      //   onlineTransactionPage,
      //   id: 4,
      // ),
      // CustomMenuItem(
      //   AppLocalizations.of(ctx)!.transactionHistory,
      //   "images/icon/payment_history_icon.png",
      //   transactionHistoryPage,
      //   login: true,
      //   id: 6,
      // ),
    ];
  }

  List<CustomMenuItem> getFavMenuList() {
    return [
      CustomMenuItem(
        AppLocalizations.of(ctx)!.latestPlate,
        "images/icon/latest_number_icon.png",
        latestPlatePage,
        id: 5,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.drivingLicense,
        "images/icon/driving_license_icon.png",
        licensePage,
        id: 6,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.testResult,
        "images/icon/test_result_icon.png",
        testResultPage,
        id: 7,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.lkm,
        "images/icon/lkm_icon.png",
        roadTaxCheckPage,
        id: 8,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.ticket,
        "images/icon/ticket_icon.png",
        summonListPage,
        login: true,
        id: 9,
      ),
    ];
  }

  List<CustomMenuItem> getOnlineTransactionList() {
    return [
      CustomMenuItem(
        AppLocalizations.of(ctx)!.latestPlate,
        "images/icon/latest_number_icon.png",
        latestPlatePage,
        id: 5,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.drivingLicense,
        "images/icon/driving_license_icon.png",
        licensePage,
        id: 6,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.testResult,
        "images/icon/test_result_icon.png",
        testResultPage,
        id: 7,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.lkm,
        "images/icon/lkm_icon.png",
        roadTaxCheckPage,
        id: 8,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.ticket,
        "images/icon/ticket_icon.png",
        summonListPage,
        login: true,
        id: 9,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.blacklist,
        "images/icon/black_list_icon.png",
        blacklistPage,
        id: 10,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.demeritPoints,
        "images/icon/demerit_point_icon.png",
        demeritPointsPage,
        id: 4,
      ),
    ];
  }

  List<CustomMenuItem> getStaffMenuList() {
    return [
      CustomMenuItem(
        "JPJeHadir",
        "images/icon/jpjehadir.png",
        eHadirMenuPage,
      ),
    ];
  }

  List<CustomMenuItem> getAdminMenuList() {
    return [
      CustomMenuItem(
        AppLocalizations.of(ctx)!.updateProfile,
        "images/vector/update_profile_icon.svg",
        profileUpdatePage,
        isSvg: true,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.vehicleNList,
        "images/vector/vehicle_list_icon.svg",
        vehicleListPage,
        isSvg: true,
      ),
      // CustomMenuItem(
      //   AppLocalizations.of(ctx)!.feedback,
      //   "images/vector/feedback_icon.svg",
      //   feedbackPage,
      //   isSvg: true,
      // ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.viewTNC,
        "images/vector/tnc_icon.svg",
        tncPage,
        isSvg: true,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.changePassword,
        "images/vector/change_password_icon.svg",
        changePasswordPage,
        isSvg: true,
      ),
    ];
  }

  List<CustomMenuItem> getPublicMenuList() {
    return [
      CustomMenuItem(
        AppLocalizations.of(ctx)!.directory,
        "images/icon/directory_icon.png",
        jpjDirectoryPage,
      ),
    ];
  }

  List<CustomMenuItem> getEzypayMenuList() {
    return [
      CustomMenuItem(
        AppLocalizations.of(ctx)!.ticket,
        "images/icon/ticket_icon.png",
        summonListPage,
        login: true,
      ),
    ];
  }

  List<CustomMenuItem> getJpjEqMenuList() {
    return [
      CustomMenuItem(
        AppLocalizations.of(ctx)!.branch,
        "images/icon/jpjeq_branch_icon.png",
        jpjEqBranchListPage,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.transaction,
        "images/icon/jpjeq_transaction_icon.png",
        jpjEqTransactionsPage,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.info,
        "images/icon/jpjeq_info_icon.png",
        jpjEqNotificationPage,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.home,
        "images/icon/jpjeq_branch_icon.png",
        jpjEqMainPage,
      ),
    ];
  }

  List<CustomMenuItem> getEaduanMenuList() {
    return [
      CustomMenuItem(
        AppLocalizations.of(ctx)!.failToFollowRedLight,
        "images/icon/eaduan_traffic_light_icon.png",
        (context) {
          eAduanFormMenuPage(context, EaduanItem.redLight);
        },
        login: true,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.emergencyLaneDriving,
        "images/icon/eaduan_emergency_lane_icon.png",
        (context) {
          eAduanFormMenuPage(context, EaduanItem.emergencyLane);
        },
        login: true,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.skipQueue,
        "images/icon/eaduan_skip_queue_icon.png",
        (context) {
          eAduanFormMenuPage(context, EaduanItem.cutQueue);
        },
        login: true,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.leftOvertake,
        "images/icon/eaduan_left_overtake_icon.png",
        (context) {
          eAduanFormMenuPage(context, EaduanItem.leftOvertake);
        },
        login: true,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.doubleLineOvertake,
        "images/icon/eaduan_double_line_overtake_icon.png",
        (context) {
          eAduanFormMenuPage(context, EaduanItem.doubleLine);
        },
        login: true,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.usingPhoneWhileDriving,
        "images/icon/eaduan_using_phone_icon.png",
        (context) {
          eAduanFormMenuPage(context, EaduanItem.usingPhone);
        },
        login: true,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.fancyPlateNumber,
        "images/icon/eaduan_fancy_plat_icon.png",
        (context) {
          eAduanFormMenuPage(context, EaduanItem.fancyPlate);
        },
        login: true,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.darkTint,
        "images/icon/eaduan_dark_tint_icon.png",
        (context) {
          eAduanFormMenuPage(context, EaduanItem.darkTint);
        },
        login: true,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.notWearingSeatbelt,
        "images/icon/eaduan_not_wearing_seatbelt_icon.png",
        (context) {
          eAduanFormMenuPage(context, EaduanItem.seatBelt);
        },
        login: true,
      ),
    ];
  }

  List<CustomMenuItem> getJpjEHadirMenuList() {
    return [
      CustomMenuItem(
        AppLocalizations.of(ctx)!.main,
        "images/icon/ehadir_main_icon.png",
        eHadirMainPage,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.activity,
        "images/icon/ehadir_activity_icon.png",
        eHadirActivityListPage,
      ),
      CustomMenuItem(
        AppLocalizations.of(ctx)!.comittee,
        "images/icon/ehadir_comittee_icon.png",
        eHadirComitteePage,
      ),
    ];
  }
}
