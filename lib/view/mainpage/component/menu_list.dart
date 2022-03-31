import 'package:jpj_info/controller/menu_action.dart';
import 'package:jpj_info/model/mainpage_icon.dart';

List<MenuItem> menuList = [
  MenuItem(
    "JPJeBid",
    "images/ebid.png",
    printffff,
  ),
  MenuItem(
    "Lesen\nKenderaan Motor",
    "images/lesen_kenderaan_icon.png",
    roadTaxCheckPage,
  ),
  MenuItem(
    "Lesen\nMemandu",
    "images/driving_license.png",
    licensePage,
  ),
  MenuItem(
    "Saman",
    "images/summons.png",
    printffff,
  ),
  MenuItem(
    "Nombor\nTerkini",
    "images/latest_number.png",
    latestPlatePage,
  ),
  MenuItem(
    "Mata\nDemerit",
    "images/mata demerit.png",
    printffff,
  ),
  MenuItem(
    "JPJeQ",
    "images/lesen_kenderaan_icon.png",
    printffff,
  ),
  MenuItem(
    "AKJAR",
    "images/lesen_kenderaan_icon.png",
    printffff,
  ),
  MenuItem(
    "Senarai\nHitam Kenderaan",
    "images/blacklist.png",
    printffff,
  ),
  MenuItem(
    "Keputusan\nUjian",
    "images/test_result.png",
    printffff,
  ),
];

List<MenuItem> favMenuList = [
  MenuItem(
    "JPJeBid",
    "images/ebid.png",
    printffff,
  ),
  MenuItem(
    "Lesen\nKenderaan Motor",
    "images/lesen_kenderaan_icon.png",
    roadTaxCheckPage,
  ),
  MenuItem(
    "Lesen\nMemandu",
    "images/driving_license.png",
    licensePage,
  ),
];

List<MenuItem> serviceMenuList = [
  MenuItem(
    "JPJeBid",
    "images/vector/ebit_icon.svg",
    printffff,
    isSvg: true,
  ),
  MenuItem(
    "JPJeQ",
    null,
    printffff,
    isSvg: true,
  ),
  MenuItem(
    "eAduan",
    "images/vector/eaduan_icon.svg",
    roadTaxCheckPage,
    isSvg: true,
  ),
  MenuItem(
    "Transaksi\nAtas Talian",
    "images/vector/online_transection_icon.svg",
    licensePage,
    isSvg: true,
  ),
  MenuItem(
    "EzyPay",
    "images/vector/easy_pay_icon.svg",
    licensePage,
    isSvg: true,
  ),
  MenuItem(
    "Sejarah\nTransaksi",
    "images/vector/history_icon.svg",
    licensePage,
    isSvg: true,
  ),
];

void printffff() {
  print("Hello From Frontw");
}
