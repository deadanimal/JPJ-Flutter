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
        () {},
        login: true,
      ),
      MenuItem(
        "eAduan",
        "images/icon/eaduan_icon.png",
        () {},
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.onlineTransection,
        "images/icon/online_transection_icon.png",
        onlineTransectionPage,
      ),
      MenuItem(
        "EzyPay",
        "images/icon/ezypay_icon.png",
        licensePage,
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.transectionHistory,
        "images/icon/payment_history_icon.png",
        licensePage,
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
        () {},
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

  List<MenuItem> getOnlineTransectionList() {
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
        () {},
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.lkm,
        "images/icon/lkm_icon.png",
        roadTaxCheckPage,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.ticket,
        "images/icon/ticket_icon.png",
        () {},
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.blacklist,
        "images/icon/black_list_icon.png",
        () {},
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.demeritPoints,
        "images/icon/demerit_point_icon.png",
        () {},
      ),
    ];
  }
}
