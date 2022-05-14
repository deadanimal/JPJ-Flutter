import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/eaduan_menu_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/eAduanSubmit/eaduan_submit.dart';
import 'package:jpj_info/view/eaduanForm/eaduan_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum EaduanItem {
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
  final EaduanItem itemClass;

  @override
  State<StatefulWidget> createState() => _EaduanFormController();
}

class _EaduanFormController extends State<EaduanFormController> {
  late Map<EaduanItem, String> aduanItemList;
  late Map<EaduanItem, String> aduanIconList;
  late ImagePicker picker;
  late List<Uint8List> images;
  @override
  void initState() {
    super.initState();
    picker = ImagePicker();
    images = [];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    aduanItemList = {
      EaduanItem.redLight: AppLocalizations.of(context)!.failToFollowRedLight,
      EaduanItem.emergencyLane:
          AppLocalizations.of(context)!.emergencyLaneDriving,
      EaduanItem.cutQueue: AppLocalizations.of(context)!.skipQueue,
      EaduanItem.leftOvertake: AppLocalizations.of(context)!.leftOvertake,
      EaduanItem.doubleLine: AppLocalizations.of(context)!.doubleLineOvertake,
      EaduanItem.usingPhone:
          AppLocalizations.of(context)!.usingPhoneWhileDriving,
      EaduanItem.fancyPlate: AppLocalizations.of(context)!.fancyPlateNumber,
      EaduanItem.darkTint: AppLocalizations.of(context)!.darkTint,
      EaduanItem.seatBelt: AppLocalizations.of(context)!.notWearingSeatbelt,
    };
    aduanIconList = {
      EaduanItem.redLight: "images/icon/eaduan_traffic_light_icon.png",
      EaduanItem.emergencyLane: "images/icon/eaduan_emergency_lane_icon.png",
      EaduanItem.cutQueue: "images/icon/eaduan_skip_queue_icon.png",
      EaduanItem.leftOvertake: "images/icon/eaduan_left_overtake_icon.png",
      EaduanItem.doubleLine: "images/icon/eaduan_double_line_overtake_icon.png",
      EaduanItem.usingPhone: "images/icon/eaduan_using_phone_icon.png",
      EaduanItem.fancyPlate: "images/icon/eaduan_fancy_plat_icon.png",
      EaduanItem.darkTint: "images/icon/eaduan_dark_tint_icon.png",
      EaduanItem.seatBelt: "images/icon/eaduan_not_wearing_seatbelt_icon.png",
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
          openGalleryCallback: _openGallery,
          submitCallback: _submitCallback,
          imagesPath: images,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  Future<void> _openGallery() async {
    // info: https://github.com/flutter/flutter/issues/18095
    // EasyLoading.show(
    //   status: AppLocalizations.of(context)!.pleaseWait,
    // );
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      Uint8List rawImageData = await image.readAsBytes();
      setState(() {
        images.add(rawImageData);
      });
    }
    // EasyLoading.dismiss();
  }

  void _submitCallback() {
    //todo: add cloud process here
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EaduanSubmitScreen(
            backBtnCallback: _backBtnCallback,
          );
        },
      ),
    );
  }

  void _backBtnCallback(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const EaduanMenuController();
        },
      ),
    );
  }

  // Future<void> _saveToDraftCallback() async {
  //   // todo: save to local storage
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  // }
}
