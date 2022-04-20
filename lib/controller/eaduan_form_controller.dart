import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/eaduanForm/eaduan_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum eaduanItem {
  redLight,
  emergencyLane,
  cutQueue,
  leftOvertake,
  doubleLine,
  usingPhone,
  fancyPlate,
  darkTint,
  seatBelt,
}

class EaduanFormController extends StatefulWidget {
  const EaduanFormController({
    Key? key,
    required this.itemClass,
  }) : super(key: key);
  final eaduanItem itemClass;

  @override
  State<StatefulWidget> createState() => _EaduanFormController();
}

class _EaduanFormController extends State<EaduanFormController> {
  late Map<eaduanItem, String> aduanItemList;
  late Map<eaduanItem, String> aduanIconList;
  late ImagePicker picker;

  @override
  void initState() {
    super.initState();
    picker = ImagePicker();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    aduanItemList = {
      eaduanItem.redLight: AppLocalizations.of(context)!.failToFollowRedLight,
      eaduanItem.emergencyLane:
          AppLocalizations.of(context)!.emergencyLaneDriving,
      eaduanItem.cutQueue: AppLocalizations.of(context)!.skipQueue,
      eaduanItem.leftOvertake: AppLocalizations.of(context)!.leftOvertake,
      eaduanItem.doubleLine: AppLocalizations.of(context)!.doubleLineOvertake,
      eaduanItem.usingPhone:
          AppLocalizations.of(context)!.usingPhoneWhileDriving,
      eaduanItem.fancyPlate: AppLocalizations.of(context)!.fancyPlateNumber,
      eaduanItem.darkTint: AppLocalizations.of(context)!.darkTint,
      eaduanItem.seatBelt: AppLocalizations.of(context)!.notWearingSeatbelt,
    };
    aduanIconList = {
      eaduanItem.redLight: "images/icon/eaduan_traffic_light_icon.png",
      eaduanItem.emergencyLane: "images/icon/eaduan_emergency_lane_icon.png",
      eaduanItem.cutQueue: "images/icon/eaduan_skip_queue_icon.png",
      eaduanItem.leftOvertake: "images/icon/eaduan_left_overtake_icon.png",
      eaduanItem.doubleLine: "images/icon/eaduan_double_line_overtake_icon.png",
      eaduanItem.usingPhone: "images/icon/eaduan_using_phone_icon.png",
      eaduanItem.fancyPlate: "images/icon/eaduan_fancy_plat_icon.png",
      eaduanItem.darkTint: "images/icon/eaduan_dark_tint_icon.png",
      eaduanItem.seatBelt: "images/icon/eaduan_not_wearing_seatbelt_icon.png",
    };
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: EaduanForm(
          title: aduanItemList[widget.itemClass],
          image: AssetImage(aduanIconList[widget.itemClass]!),
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  Future<void> openGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  }
}
