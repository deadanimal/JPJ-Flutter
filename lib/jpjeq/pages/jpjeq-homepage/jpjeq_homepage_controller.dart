import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/one_signal_controller.dart';
import 'package:jpj_info/helper/geolocation.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/helper/qr_scanner.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/dummy.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_branch_by_qr_response.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_nearby_branches_response.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_qr_format.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_service_group_response.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-homepage/jpjeq_choose_service.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-homepage/jpjeq_homepage.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-homepage/jpjeq_wrong_operating_hour.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-number-queue/jpjeq_number_queue_controller.dart';
import 'package:jpj_info/jpjeq/services/branch_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JpjEqHomepageController extends StatefulWidget {
  const JpjEqHomepageController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqHomepageController();
}

class _JpjEqHomepageController extends State<JpjEqHomepageController> {
  double currentLat = 1.857434, currentLong = 103.082021;
  String locationName = '';
  String nearestBranch = '';
  String? selectedServiceId;
  DateTime? waitScanTime;
  Duration? waitingTime;
  int? waitingTimeMinute;
  int? waitingTimeSecond;
  @override
  void initState() {
    OneSignalController().promnptForNotification();
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 250),
      getUserLocation,
    );
    Future.delayed(
      const Duration(milliseconds: 500),
      _checkForActiveQueue,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: JpjEqHomepage(
          getLocation: getUserLocation,
          scanBtnCallback: scan,
          locationName: locationName,
          nearestBranch: nearestBranch,
          waitingTime: waitingTime,
          waitingTimeMinute: waitingTimeMinute,
          waitingTimeSecond: waitingTimeSecond,
        ),
        bottomNavigationBar: const JpjEqBottomNavController(),
      ),
    );
  }

  Future<void> getUserLocation() async {
    setState(() {
      locationName = '';
      nearestBranch = '';
    });
    try {
      Position userLocation = await Geolocation().determinePosition();
      currentLong = userLocation.longitude;
      currentLat = userLocation.latitude;

      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLat,
        currentLong,
        localeIdentifier: 'ms_MY',
      );
      for (var el in placemarks) {
        if (el.street != null &&
            !_isNumber(el.street![0]) &&
            locationName == '') {
          locationName = el.street!;
        }
      }
      getNearbyBranchList();
    } catch (e) {
      locationName = AppLocalizations.of(context)!.error;
      nearestBranch = AppLocalizations.of(context)!.error;
      AlertController(ctx: context).generalError(
        AppLocalizations.of(context)!.locationPermissionError,
        () {
          Navigator.pop(context);
        },
      );
    }
    setState(() {});
  }

  bool _isNumber(String character) {
    List<String> numbers = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
    ];
    return numbers.contains(character);
  }

  void _qrScanCallback(Barcode barcode) {
    Navigator.pop(context);
    try {
      String? qrData = barcode.rawValue;
      JpjEqQrFormat qr = JpjEqQrFormat.fromJson(jsonDecode(qrData!));

      BranchService().getBranchByQr(context, qr.param ?? '', (Response res) {
        if (res.statusCode == 200) {
          JpjEqGetBrancheByQrResponse response =
              JpjEqGetBrancheByQrResponse.fromJson(jsonDecode(res.body));

          if (response.data != null && response.data!.isNotEmpty) {
            SharedPreferences.getInstance().then((pref) {
              pref.setString(
                LocalStorageHelper().jpjEqTime,
                response.data![0].selaMasa.toString(),
              );

              pref.setString(
                LocalStorageHelper().jpjEqBranchInfo,
                jsonEncode(response.toJson()),
              );

              BranchService()
                  .getServiceGroup(context, qr.param ?? '', qr.idCawangan ?? '',
                      (Response res2) {
                if (res2.statusCode == 200) {
                  JpjEqServiceGroupResponse serviceGroupResponse =
                      JpjEqServiceGroupResponse.fromJson(
                    jsonDecode(
                      res2.body,
                      // Dummy().getServiceGroupResponse,
                    ),
                  );

                  if (serviceGroupResponse.status == '0') {
                    pref.setString(
                      LocalStorageHelper().jpjEqQrPayload,
                      jsonEncode(qr.toJson()),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return JpjEqChooseService(
                            serviceItems: serviceGroupResponse,
                          );
                        },
                      ),
                    ).then((value) {
                      _checkForWaitingTime();
                    });
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return JpjEqWrongOperatingHour(
                            reason: serviceGroupResponse.msg ?? "",
                            endTime: serviceGroupResponse.waktuTamat ?? "",
                            startTime: serviceGroupResponse.waktuMula ?? "",
                          );
                        },
                      ),
                    ).then((value) {
                      _checkForWaitingTime();
                    });
                  }
                }
              });
            });
          }
        }
      });
    } catch (e) {
      AlertController(ctx: context).generalError(
        AppLocalizations.of(context)!.invalidQrCode,
        () {
          Navigator.pop(context);
        },
      );
    }
  }

  void scan() {
    // todo: check if allowed to scan, if no show error message
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return QrScanner(
            qrScanCallback: _qrScanCallback,
          );
        },
      ),
    ).then((value) {
      _checkForWaitingTime();
    });
  }

  getNearbyBranchList() {
    BranchService().getNearbyBranchList(context, currentLat, currentLong,
        (Response res) {
      if (res.statusCode == 200) {
        if (res.body == '') {
          setState(() {
            nearestBranch = AppLocalizations.of(context)!.error;
          });
        }
        JpjEqNearbyBranchesResponse response =
            JpjEqNearbyBranchesResponse.fromJson(jsonDecode(res.body));
        if (response.data != null && response.data!.isNotEmpty) {
          setState(() {
            nearestBranch = response.data![0].namaCawangan!;
          });
        }
      } else {
        setState(() {
          nearestBranch = AppLocalizations.of(context)!.error;
        });
      }
    });
  }

  _checkForActiveQueue() {
    SharedPreferences.getInstance().then((value) async {
      String? rawValue = value.getString(
        LocalStorageHelper().jpjeQNumberInfo,
      );
      if (rawValue != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const JpjEqNumberQueueController();
            },
          ),
        ).then((value) {
          _checkForWaitingTime();
        });
      } else {
        _checkForWaitingTime();
      }
    });
  }

  _checkForWaitingTime() {
    SharedPreferences.getInstance().then((value) async {
      String? rawValue = value.getString(
        LocalStorageHelper().jpjEqTime,
      );
      if (rawValue != null) {
        _handleWaitingTime(int.parse(rawValue));
      }
    });
  }

  _handleWaitingTime(waitTime) {
    DateTime now = DateTime.now();
    waitScanTime = now.add(
      Duration(seconds: waitTime),
    );
    _refreshWaitingTime();
  }

  _refreshWaitingTime() {
    DateTime now = DateTime.now();
    if (waitScanTime != null) {
      if (now.isAfter(waitScanTime!)) {
        setState(() {
          waitScanTime = null;
          SharedPreferences.getInstance().then((value) async {
            value.remove(LocalStorageHelper().jpjEqTime);
            getWaitingTime();
          });
        });
      } else {
        getWaitingTime();
        Future.delayed(
          const Duration(milliseconds: 1000),
          _refreshWaitingTime,
        );
      }
    }
  }

  getWaitingTime() {
    DateTime now = DateTime.now();
    if (waitScanTime != null) {
      setState(() {
        waitingTime = waitScanTime!.difference(now);
        waitingTimeMinute = waitingTime?.inMinutes;
        waitingTimeSecond = waitingTime?.inSeconds;

        waitingTimeMinute ??= 0;
        waitingTimeSecond ??= 0;

        waitingTimeSecond =
            (waitingTimeSecond! - ((waitingTimeMinute!) * 60)).toInt();
      });
    } else {
      setState(() {
        waitingTime = null;
      });
    }
  }
}
