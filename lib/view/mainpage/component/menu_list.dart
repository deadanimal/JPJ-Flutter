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
        roadTaxCheckPage,
        login: true,
      ),
      MenuItem(
        AppLocalizations.of(ctx)!.onlineTransection,
        "images/icon/online_transection_icon.png",
        licensePage,
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
}
