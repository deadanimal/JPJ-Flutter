import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/helper/geolocation.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/helper/qr_scanner.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_branch_by_qr_response.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_nearby_branches_response.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_qr_format.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_service_group_response.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-homepage/jpjeq_choose_service.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-homepage/jpjeq_homepage.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-homepage/jpjeq_wrong_operating_hour.dart';
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
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 250),
      getUserLocation,
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

              BranchService()
                  .getServiceGroup(context, qr.param ?? '', qr.idCawangan ?? '',
                      (Response res2) {
                if (res2.statusCode == 200) {
                  JpjEqServiceGroupResponse serviceGroupResponse =
                      JpjEqServiceGroupResponse.fromJson(
                    jsonDecode(
                      res2.body,
                      // '{"status": "0","msg": "All Clear","data2": [{"id": "135","keterangan": "Pelesenan","kategori": "2","had_kategori": null,"info": [{"keterangan": "Pembaharuan Lesen Memandu Malaysia (CDL)"},{"keterangan": "Pindaan Alamat"},{"keterangan": "Permohonan Pembaharuan Lesen Belajar Memandu (LDL)"},{"keterangan": "Permohonan Lesen Memandu Baharu (PDL ke CDL)"},{"keterangan": "Permohonan Permbaharuan Lesen Memandu (CDL)"},{"keterangan": "Permohonan Lesen Memandu Baharu (PDL kepada CDL)"},{"keterangan": "Permohonan Lesen Memandu Baharu (PDL)"},{"keterangan": "Permohonan Lesen Memandu Baharu (LDL)"},{"keterangan": "Permohonan Pembaharuan Lesen Vokasional"},{"keterangan": "Permohonan Salinan Lesen Memandu"},{"keterangan": "Permohonan Salinan Gantian Lesen Memandu"},{"keterangan": "Permohonan Permit Pemandu Antarabangsa (IDP)"},{"keterangan": "Permohonan Tambah Kelas Lesen Memandu"},{"keterangan": "Permohonan Butir-butir dan Pengesahan Lesen Memandu"},{"keterangan": "Permohonan Pengemaskinian Maklumat Peribadi Pemilik"},{"keterangan": "Permohonan pembaharuan lesen memandu (LDL / CDL) dan lesen vokasional (PSV / GDL / Konduktor) "},{"keterangan": "Permohonan salinan lesen memandu (LDL / PDL / CDL) dan lesen vokasional (PSV / GDL / Konduktor) "},{"keterangan": "Permohonan gantian lesen memandu dan lesen vokasional"},{"keterangan": "Permohonan butir-butir lesen memandu - permohonan oleh pemilik sahaja"},{"keterangan": "Permohonan pembaharuan lesen memandu (CDL) untuk kegunaan perkhidmatan awam dan barangan sahaja"},{"keterangan": "Pembaharuan CDL (PTM / MYKAS / Bukan Warganegara) "},{"keterangan": "Pembaharuan LDL  "},{"keterangan": "Permohonan Baharu GDL / PSV"},{"keterangan": "Permohonan Baharu PDL (PTM / MYKAS / Bukan Warganegara) "},{"keterangan": "Permohonan Baharu PDL (Warganegara)"},{"keterangan": "Permohonan Gantian LDL / PDL / GDL / PSV"},{"keterangan": "Permohonan Salinan GDL / PSV"},{"keterangan": "Permohonan Salinan LDL"},{"keterangan": "Permohonan Salinan PDL / CDL"},{"keterangan": "Permohonan Tambah Kelas GDL / PSV"},{"keterangan": "Permohonan Tambah Kelas LDL  "},{"keterangan": "Pindaan Butiran Lesen  (D>DA / B>B2)  "},{"keterangan": "Pembaharuan CDL Pemandu/ Penunggang p-Hailing"},{"keterangan": "Pembaharuan CDL - urusniaga atas talian"}]},{"id": "335","keterangan": "Pelbagai","kategori": "2","had_kategori": null,"info": [{"keterangan": "Khas"},{"keterangan": "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)"},{"keterangan": "Pembayaran Saman "},{"keterangan": "Permohonan Pembaharuan Lesen Belajar Memandu (LDL)"},{"keterangan": "Permohonan Lesen Memandu Baharu (PDL ke CDL)"},{"keterangan": "Permohonan Gantian Vehicle Of Certication (VOC)"},{"keterangan": "Permohonan Permbaharuan Lesen Memandu (CDL)"},{"keterangan": "Permohonan Pembaharuan Lesen Vokasional"},{"keterangan": "Permohonan Permit Pemandu Antarabangsa (IDP)"},{"keterangan": "Permohonan Pengemaskinian Maklumat Peribadi Pemilik"},{"keterangan": "Permohonan Pindaan Alamat Pemilik"},{"keterangan": "Permohonan Pembatalan Tuntutan E-Hakmilik"},{"keterangan": "Permohonan ID Awam"},{"keterangan": "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen\\r\\n Memandu Malaysia (LMM) secara online di Portal JPJ\\r\\n"},{"keterangan": "Permohonan salinan Lesen Kenderaan Motor  (LKM) - kenderaan persendirian individu sahaja"},{"keterangan": "Permohonan gantian Lesen Kenderaan Motor  (LKM)  - kenderaan persendirian individu sahaja"},{"keterangan": "Permohonan salinan Sijil Pemilikan Kenderaan (VOC)  - kenderaan persendirian individu sahaja"},{"keterangan": "Permohonan pertukaran hak milik kenderaan - kenderaan persendirian individu sahaja"},{"keterangan": "Permohonan butir-butir insuran kenderaan - permohonan oleh pemilik berdaftar sahaja"},{"keterangan": "Permohonan butir-butir maklumat kenderaan - permohonan oleh pemilik berdaftar sahaja"},{"keterangan": "Permohonan bayaran balik Lesen Kenderaan Motor  (LKM) (terima permohonan sahaja, proses dibuat di JPJ Negeri/Cawangan)"},{"keterangan": "Cetakan Sijil Pemilikan Kenderaan (VOC) bagi urusan pertukaran hak milik\\r\\nsecara online di Portal JPJ\\r\\n"},{"keterangan": "Cetakan Lesen Kenderaan Motor  (LKM) bagi urusniaga pembaharuan LKM secara Online di Portal JPJ"},{"keterangan": "Cetakan Sijil Pemilikan Kenderaan (VOC)  bagi urusniaga Pendaftaran Kali Pertama Secara\\r\\nOnline di Portal JPJ\\r\\n"},{"keterangan": "Cetakan Lesen Kenderaan Motor  (LKM) bagi urusniaga Pendaftaran Kali Pertama Secara \\r\\nOnline di Portal JPJ\\r\\n"},{"keterangan": "Permohonan butir-butir lesen memandu - permohonan oleh pemilik sahaja"},{"keterangan": "Permohonan Gantian LDL / PDL / GDL / PSV"},{"keterangan": "Permohonan Salinan GDL / PSV"},{"keterangan": "Permohonan Salinan PDL / CDL"}]},{"id": "352","keterangan": "Kiosk","kategori": "2","had_kategori": null,"info": [{"keterangan": "Pembayaran Saman "},{"keterangan": "Permohonan Butir-butir Maklumat Kenderaan"},{"keterangan": "Permohonan Butir-butir Maklumat Insuran Kenderaan"},{"keterangan": "Cetakan Sijil Pemilikan Kenderaan (VOC) bagi urusan pertukaran hak milik\\r\\nsecara online di Portal JPJ\\r\\n"},{"keterangan": "Cetakan Lesen Kenderaan Motor  (LKM) bagi urusniaga pembaharuan LKM secara Online di Portal JPJ"},{"keterangan": "Cetakan Lesen Kenderaan Motor  (LKM) bagi urusniaga Pendaftaran Kali Pertama Secara \\r\\nOnline di Portal JPJ\\r\\n"},{"keterangan": "Permohonan salinan Lesen Kenderaan Motor  (LKM)  - kenderaan persendirian individu selain motosikal sahaja"},{"keterangan": "Cetakan Sijil Pemilikan Kenderaan (VOC)  bagi urusniaga Pendaftaran Kali Pertama Secara Online di Portal JPJ"}]},{"id": "591","keterangan": "Penguatkuasaan","kategori": "2","had_kategori": null,"info": [{"keterangan": "Permohonan Bayaran Kompaun"}]},{"id": "963","keterangan": "Pemeriksaan Kenderaan (KA)","kategori": "2","had_kategori": null,"info": [{"keterangan": "Pelbagai"}]}]}',
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
                    );
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
                    );
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
    );
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
}
