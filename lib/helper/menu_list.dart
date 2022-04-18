import 'package:flutter/cupertino.dart';
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
        roadTaxCheckPage,
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
        () {},
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
        () {},
      ),
    ];
  }

  List<MenuItem> getEaduanMenuList() {
    return [
      MenuItem(
        AppLocalizations.of(ctx)!.failToFollowRedLight,
        "images/icon/eaduan_traffic_light_icon.png",
        () {},
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.emergencyLaneDriving,
        "images/icon/eaduan_emergency_lane_icon.png",
        () {},
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.skipQueue,
        "images/icon/eaduan_skip_queue_icon.png",
        () {},
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.leftOvertake,
        "images/icon/eaduan_left_overtake_icon.png",
        () {},
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.doubleLineOvertake,
        "images/icon/eaduan_double_line_overtake_icon.png",
        () {},
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.usingPhoneWhileDriving,
        "images/icon/eaduan_using_phone_icon.png",
        () {},
        login: true,
      ),
    ];
  }
}
