import 'package:flutter/cupertino.dart';
import 'package:jpj_info/controller/eaduan_form_controller.dart';
import 'package:jpj_info/controller/menu_action.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuList {
  MenuList({required this.ctx});
  late BuildContext ctx;

  List<MenuItem> getServisMenuList() {
    return [
      MenuItem(
        "JPJeBid",
        "images/icon/ebit_icon.png",
        () {},
      ),
      MenuItem(
        "JPJeQ",
        "images/icon/jpjeq_icon.png",
        jpjEqMenuPage,
        login: true,
      ),
      MenuItem(
        "eAduan",
        "images/icon/eaduan_icon.png",
        eAduanMenuPage,
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.onlineTransaction,
        "images/icon/online_transaction_icon.png",
        onlineTransactionPage,
      ),
      MenuItem(
        "EzyPay",
        "images/icon/ezypay_icon.png",
        ezypayMenuPage,
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.transactionHistory,
        "images/icon/payment_history_icon.png",
        transactionHistoryPage,
        login: true,
      ),
    ];
  }

  List<MenuItem> getFavMenuList() {
    return [
      MenuItem(
        "JPJeBid",
        "images/icon/ebit_icon.png",
        () {},
      ),
      MenuItem(
        "JPJeQ",
        "images/icon/jpjeq_icon.png",
        jpjEqMenuPage,
        login: true,
      ),
      MenuItem(
        "eAduan",
        "images/icon/eaduan_icon.png",
        eHadirMenuPage,
        login: true,
      ),
    ];
  }

  List<MenuItem> getOnlineTransactionList() {
    return [
      MenuItem(
        AppLocalizations.of(ctx)!.latestPlate,
        "images/icon/latest_number_icon.png",
        latestPlatePage,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.drivingLicense,
        "images/icon/driving_license_icon.png",
        licensePage,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.testResult,
        "images/icon/test_result_icon.png",
        testResultPage,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.lkm,
        "images/icon/lkm_icon.png",
        roadTaxCheckPage,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.ticket,
        "images/icon/ticket_icon.png",
        summonListPage,
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.blacklist,
        "images/icon/black_list_icon.png",
        blacklistPage,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.demeritPoints,
        "images/icon/demerit_point_icon.png",
        demeritPointsPage,
      ),
    ];
  }

  List<MenuItem> getStaffMenuList() {
    return [
      MenuItem(
        "JPJeHadir",
        "images/icon/jpjehadir.png",
        eHadirMenuPage,
      ),
    ];
  }

  List<MenuItem> getAdminMenuList() {
    return [
      MenuItem(
        AppLocalizations.of(ctx)!.updateProfile,
        "images/vector/update_profile_icon.svg",
        profileUpdatePage,
        isSvg: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.vehicleNList,
        "images/vector/vehicle_list_icon.svg",
        vehicleListPage,
        isSvg: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.feedback,
        "images/vector/feedback_icon.svg",
        feedbackPage,
        isSvg: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.viewTNC,
        "images/vector/tnc_icon.svg",
        tncPage,
        isSvg: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.changePassword,
        "images/vector/change_password_icon.svg",
        changePasswordPage,
        isSvg: true,
      ),
    ];
  }

  List<MenuItem> getPublicMenuList() {
    return [
      MenuItem(
        AppLocalizations.of(ctx)!.directory,
        "images/icon/directory_icon.png",
        jpjDirectoryPage,
      ),
    ];
  }

  List<MenuItem> getEzypayMenuList() {
    return [
      MenuItem(
        AppLocalizations.of(ctx)!.ticket,
        "images/icon/ticket_icon.png",
        summonListPage,
        login: true,
      ),
    ];
  }

  List<MenuItem> getJpjEqMenuList() {
    return [
      MenuItem(
        AppLocalizations.of(ctx)!.branch,
        "images/icon/jpjeq_branch_icon.png",
        jpjDirectoryPage,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.transaction,
        "images/icon/jpjeq_transaction_icon.png",
        () {},
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.info,
        "images/icon/jpjeq_info_icon.png",
        () {},
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.home,
        "images/icon/jpjeq_branch_icon.png",
        jpjEqMainPage,
      ),
    ];
  }

  List<MenuItem> getEaduanMenuList() {
    return [
      MenuItem(
        AppLocalizations.of(ctx)!.failToFollowRedLight,
        "images/icon/eaduan_traffic_light_icon.png",
        (context) {
          eAduanFormMenuPage(context, eaduanItem.redLight);
        },
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.emergencyLaneDriving,
        "images/icon/eaduan_emergency_lane_icon.png",
        (context) {
          eAduanFormMenuPage(context, eaduanItem.emergencyLane);
        },
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.skipQueue,
        "images/icon/eaduan_skip_queue_icon.png",
        (context) {
          eAduanFormMenuPage(context, eaduanItem.cutQueue);
        },
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.leftOvertake,
        "images/icon/eaduan_left_overtake_icon.png",
        (context) {
          eAduanFormMenuPage(context, eaduanItem.leftOvertake);
        },
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.doubleLineOvertake,
        "images/icon/eaduan_double_line_overtake_icon.png",
        (context) {
          eAduanFormMenuPage(context, eaduanItem.doubleLine);
        },
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.usingPhoneWhileDriving,
        "images/icon/eaduan_using_phone_icon.png",
        (context) {
          eAduanFormMenuPage(context, eaduanItem.usingPhone);
        },
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.fancyPlateNumber,
        "images/icon/eaduan_fancy_plat_icon.png",
        (context) {
          eAduanFormMenuPage(context, eaduanItem.fancyPlate);
        },
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.darkTint,
        "images/icon/eaduan_dark_tint_icon.png",
        (context) {
          eAduanFormMenuPage(context, eaduanItem.darkTint);
        },
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.notWearingSeatbelt,
        "images/icon/eaduan_not_wearing_seatbelt_icon.png",
        (context) {
          eAduanFormMenuPage(context, eaduanItem.seatBelt);
        },
        login: true,
      ),
    ];
  }

  List<MenuItem> getJpjEHadirMenuList() {
    return [
      MenuItem(
        AppLocalizations.of(ctx)!.main,
        "images/icon/ehadir_main_icon.png",
        eHadirMainPage,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.activity,
        "images/icon/ehadir_activity_icon.png",
        eHadirActivityListPage,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.comittee,
        "images/icon/ehadir_comittee_icon.png",
        eHadirComitteePage,
      ),
    ];
  }
}
