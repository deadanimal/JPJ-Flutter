import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/eaduan_menu_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/eaduan_draft.dart';
import 'package:jpj_info/helper/geolocation.dart';
import 'package:jpj_info/helper/map_location_setter.dart';
import 'package:jpj_info/model/aduan_draft.dart';
import 'package:jpj_info/model/aduan_save_request.dart';
import 'package:jpj_info/model/aduan_save_response.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/eAduanSubmit/eaduan_submit.dart';
import 'package:jpj_info/view/eaduanForm/eaduan_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

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
    this.id,
    this.draft,
  }) : super(key: key);
  final EaduanItem itemClass;
  final String? id;
  final AduanDraft? draft;

  @override
  State<StatefulWidget> createState() => _EaduanFormController();
}

class _EaduanFormController extends State<EaduanFormController> {
  late Iterable<String> dropdownList;
  String dropdownValue = "";
  Map<String, String> stateMap = {
    "JOHOR": "J",
    "KEDAH": "K",
    "LANGKAWI": "KV",
    "KELANTAN": "D",
    "MELAKA": "M",
    "NEGERI SEMBILAN": "N",
    "PAHANG": "C",
    "PULAU PINANG": "P",
    "PERAK": "A",
    "PERLIS": "R",
    "SELANGOR": "B",
    "TERENGGANU": "T",
    "SABAH": "SA",
    "SERAWAK": "SRWK",
    "W.P KUALA LUMPUR": "W",
    "W.P LABUAN": "L",
    "W.P PUTRAJAYA": "F",
  };
  late Map<EaduanItem, String> aduanItemList;
  late Map<EaduanItem, String> aduanIconList;
  late Map<EaduanItem, int> offenceId;
  late ImagePicker picker;
  late List<Uint8List> images;
  late TextEditingController dateController;
  late TextEditingController timeController;
  late TextEditingController latitudeController;
  late TextEditingController longitudeController;
  late TextEditingController remarkController;
  late TextEditingController locationController;
  late TextEditingController stateController;
  late TextEditingController vehicleController;
  late MapController mapController;

  @override
  void initState() {
    super.initState();
    picker = ImagePicker();
    images = [];
    dateController = TextEditingController();
    timeController = TextEditingController();
    latitudeController = TextEditingController();
    latitudeController.text = "3.146267";
    longitudeController = TextEditingController();
    longitudeController.text = "101.69";
    remarkController = TextEditingController();
    locationController = TextEditingController();
    stateController = TextEditingController();
    vehicleController = TextEditingController();
    mapController = MapController();
    offenceId = {
      EaduanItem.redLight: 1,
      EaduanItem.emergencyLane: 2,
      EaduanItem.cutQueue: 3,
      EaduanItem.leftOvertake: 4,
      EaduanItem.doubleLine: 5,
      EaduanItem.usingPhone: 6,
      EaduanItem.fancyPlate: 7,
      EaduanItem.darkTint: 8,
      EaduanItem.seatBelt: 9,
    };

    if (widget.draft != null) {
      populateItemFromDraft();
    } else {
      Future.delayed(
        const Duration(milliseconds: 250),
        getUserLocation,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    timeController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    remarkController.dispose();
    locationController.dispose();
    stateController.dispose();
    vehicleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dropdownList = [AppLocalizations.of(context)!.state, ...stateMap.keys];
    if (dropdownValue == "") {
      dropdownValue = AppLocalizations.of(context)!.state;
    }
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
          dateController: dateController,
          timeController: timeController,
          datePickerCb: pickDate,
          timePickerCb: pickTime,
          latitudeController: latitudeController,
          longitudeController: longitudeController,
          locationController: locationController,
          remarkController: remarkController,
          stateController: stateController,
          vehicleController: vehicleController,
          mapTapCb: _onMapTap,
          dropdownList: dropdownList,
          dropdownValue: dropdownValue,
          selectionCallback: selectionCallback,
          eraseImageCallback: _eraseImage,
          mapController: mapController,
          draftBtnCallback: _saveToDraftCallback,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        dateController.text = formattedDate;
      });
    } else {
      // print("Date is not selected");
    }
  }

  void pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      String formattedDate = pickedTime.format(context);

      setState(() {
        timeController.text = formattedDate;
      });
    } else {
      // print("Date is not selected");
    }
  }

  Future<void> _openGallery(String mediaType, String source) async {
    // info: https://github.com/flutter/flutter/issues/18095
    // EasyLoading.show(
    //   status: AppLocalizations.of(context)!.pleaseWait,
    // );
    final XFile? image;
    if (mediaType == "image") {
      image = await picker.pickImage(
        source: source == "camera" ? ImageSource.camera : ImageSource.gallery,
      );
    } else {
      image = await picker.pickVideo(
        source: source == "camera" ? ImageSource.camera : ImageSource.gallery,
      );
    }
    if (image != null) {
      Uint8List rawImageData = await image.readAsBytes();
      setState(() {
        images.add(rawImageData);
      });
    }
    // EasyLoading.dismiss();
  }

  void _fileUploadResponseHandler(http.StreamedResponse response) {
    if (response.statusCode == 200) {
      response.stream.bytesToString().then(
        (value) {
          AduanSaveResponse res = AduanSaveResponse.fromJson(jsonDecode(value));
          if (res.status == "saved") {
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
          } else {
            AlertController(ctx: context).generalError(
                AppLocalizations.of(context)!.errorPleaseTryAgain, () {
              Navigator.pop(context);
            });
          }
        },
      );
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  void _submitCallback() async {
    if (dateController.text != "" &&
        timeController.text != "" &&
        latitudeController.text != "" &&
        longitudeController.text != "" &&
        remarkController.text != "" &&
        locationController.text != "" &&
        stateController.text != "" &&
        stateController.text != "Negeri" &&
        stateController.text != "State" &&
        vehicleController.text != "") {
      EasyLoading.show(
        status: AppLocalizations.of(context)!.pleaseWait,
      );
      SiteConfig conf = SiteConfig();
      http.MultipartRequest request = http.MultipartRequest(
        'POST',
        Uri.parse(conf.saveAduanUri),
      );

      request.fields['catatan'] = remarkController.text;
      request.fields['idkesalahan'] = offenceId[widget.itemClass]!.toString();
      request.fields['latitude'] = latitudeController.text;
      request.fields['longlitude'] = longitudeController.text;
      request.fields['masa'] = timeController.text;
      request.fields['tarikh'] = dateController.text;
      request.fields['lokasi'] = locationController.text;
      request.fields['negeri'] = stateController.text;
      request.fields['nokenderaan'] = vehicleController.text;
      request.fields['videoName'] = "";
      request.fields['imageName'] = "";
      request.fields['pautan'] = "";
      request.fields['pengadu'] = MyJPJAccountManager().id;

      List<http.MultipartFile> newList = <http.MultipartFile>[];

      for (int i = 0; i < images.length; i++) {
        XFile a = XFile.fromData(images[i]);
        var length = await a.length();

        var multipartFile = http.MultipartFile("gambar", a.openRead(), length,
            filename: "attachement_$i");
        newList.add(multipartFile);
      }

      request.files.addAll(newList);
      var response = await request.send();
      EasyLoading.dismiss();
      _fileUploadResponseHandler(response);
    } else {
      AlertController(ctx: context).generalError(
        AppLocalizations.of(context)!.pleaseFillAllInfo,
        () {
          Navigator.pop(context);
        },
      );
    }
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

  Future<void> _saveToDraftCallback() async {
    String draftId = widget.id != null ? widget.id! : DateTime.now().toString();
    AduanDraft draftContent = AduanDraft(
      id: draftId,
      images: images,
      details: AduanSaveRequest(
        latitude: latitudeController.text,
        longlitude: longitudeController.text,
        lokasi: locationController.text,
        idkesalahan: widget.itemClass.toString(),
        masa: timeController.text,
        tarikh: dateController.text,
        negeri: stateController.text,
        nokenderaan: vehicleController.text,
        catatan: remarkController.text,
      ),
    );

    EAduanDraft().saveAsDraft(draftContent);

    AlertController(ctx: context).popup(
      AppLocalizations.of(context)!.saveAsDraftSuccess,
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const EaduanMenuController();
            },
          ),
        );
      },
    );
  }

  Future<void> _onMapTap(String lat, String long) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MapLocationSetter(
            lat: latitudeController.text,
            long: longitudeController.text,
          );
        },
      ),
    );
    if (result != null) {
      setState(() {
        latitudeController.text = result["lat"];
        longitudeController.text = result["long"];
        mapController.move(
          LatLng(
            double.parse(result["lat"]),
            double.parse(result["long"]),
          ),
          15,
        );
      });
    }
  }

  selectionCallback(BuildContext context, dynamic val) {
    stateController.text = val;
  }

  void _eraseImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  Future<void> getUserLocation() async {
    Position userLocation = await Geolocation().determinePosition();
    setState(() {
      longitudeController.text = userLocation.longitude.toString();
      latitudeController.text = userLocation.latitude.toString();
      mapController.move(
        LatLng(userLocation.latitude, userLocation.longitude),
        15,
      );
    });
  }

  populateItemFromDraft() {
    if (widget.draft != null && widget.draft?.details != null) {
      dateController.text = widget.draft!.details!.tarikh ?? "";
      timeController.text = widget.draft!.details!.masa ?? "";
      latitudeController.text = widget.draft!.details!.latitude ?? "";
      longitudeController.text = widget.draft!.details!.longlitude ?? "";
      remarkController.text = widget.draft!.details!.catatan ?? "";
      locationController.text = widget.draft!.details!.lokasi ?? "";
      stateController.text = widget.draft!.details!.negeri ?? "";
      vehicleController.text = widget.draft!.details!.nokenderaan ?? "";
      dropdownValue = stateController.text;
      for (var el in widget.draft!.images!) {
        images.add(el);
      }
    }
  }
}
