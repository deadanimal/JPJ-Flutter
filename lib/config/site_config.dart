import 'dart:convert';

import 'package:device_information/device_information.dart';
import 'package:hash/hash.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_request_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SiteConfig {
  static String appStoreUrl = 'itms-apps://apps.apple.com/us/app';
  static String playStoreUrl = 'market://details?id';
  static String caravelUrl = "https://api.caravel.space/jpj";
  // static String prodUrl = "10.180.4.94/api";
  static String prodUrl = "https://myjpj.jpj.gov.my/api";
  // static String prodUrl = caravelUrl;

  final String changePasswordUri = "$prodUrl/change_password_id_awam/";
  final String blacklistCheckUri = "$prodUrl/semakan_status_senarai_hitam/";
  final String loginUri = "$prodUrl/log_masuk/";
  final String roadTaxCheckUri =
      "$prodUrl/semakan_tarikh_luput_lesen_kenderaan_motor/";
  final String registrationUri = "$prodUrl/register_id_awam/";
  final String licenseCheckUri = "$prodUrl/semakan_tarikh_luput_lesen_memandu/";
  final String checkUserIdUri = "$prodUrl/semak_id_awam/";
  final String testResultUri = "$prodUrl/semakan_ujian_memandu/";
  final String demeritCheckUri = "$prodUrl/semakan_dimerit/";
  final String summonCheckUri = "$prodUrl/semaksaman/";
  final String plateNumberUri = "$prodUrl/semakan_nombor_pendaftaran/";
  final String securityQuestionUri = "$prodUrl/soalan_keselamatan/";
  final String locationCheckUri = "$prodUrl/jpjinfo-api/apps/semaklokasi/";
  final String aduanStatusUri = "$prodUrl/get_status_aduan/";
  final String saveAduanUri = "$prodUrl/simpan_aduan/";
  final String aduanImageUploadUri = "$prodUrl/upld_images/";
  final String resetPasswordUri = "$prodUrl/reset_password_id_awam/";
  final String faq = "https://www.jpj.gov.my/web/main-site/lesen-kenderaan";
  // final String faq = "$prodUrl/faq";
  final String directory = "$prodUrl/direktori/";
  final String tnc = "$prodUrl/tnc/";
  final String share = "$prodUrl/share/";
  final String allInboxItem = "$prodUrl/get_peti_masuk/";
  final String unreadItem = "$prodUrl/get_unread_noti/";
  final String updateInboxItem = "$prodUrl/update_status_noti/";
  final String vehicleInfo = "$prodUrl/maklumat_kenderaan/";
  final String updateAduan = "$prodUrl/kemaskini_aduan/";

  //staging api
  final String checkUserIdUrierr = "$prodUrl/semak-id-awam/err.php";

  //ehadir
  final String eHadirActivityList = "$prodUrl/senarai_aktiviti/";
  final String eHadirAttendingActivityList = "$prodUrl/senarai_aktiviti_hadir/";
  final String eHadirNewActivity = "$prodUrl/tambah_aktiviti/";
  final String eHadirRemoveComittee = "$prodUrl/padam_urusetia/";
  final String eHadirComitteeList = "$prodUrl/senarai_urusetia1/";
  final String eHadirAddComittee = "$prodUrl/tambah_urusetia/";
  final String eHadirActivityById = "$prodUrl/aktiviti_byid/";
  final String eHadirUpdateActivity = "$prodUrl/kemaskini_aktiviti";
  final String eHadirManualRegister = "$prodUrl/daftar_manual";
  final String eHadirAttendee = "$prodUrl/senarai_kehadiran";
  final String eHadirAttendeeQr = "$prodUrl/daftarQR";
  final String eHadirEraseAttendee = "$prodUrl/padam_kehadiran/";
  final String eHadirEraseCommitee = "$prodUrl/padam_urusetia2/";
  final String eHadirGetActivityByTransId = "$prodUrl/aktiviti_by_transid/";

  //JpjeQ
  static String jpjEqUrl = "https://egate.jpj.gov.my/smartqv2-pnsb/api";
  final String eQGetBranchList = "$jpjEqUrl/getListCawangan/";
  final String eQGetBranchService = "$jpjEqUrl/getKategoriServis/";
  final String eQGetBranchByQr = "$jpjEqUrl/getCawanganByQr/";
  final String eQGetServiceKategory = "$jpjEqUrl/getKategoriServis/";
  final String eQGetServiceGroup = "$jpjEqUrl/getServiceGroup/";
  final String eQGetTicketNumber = "$jpjEqUrl/getTicketNo/";
  final String eQRefreshWaitingTime = "$jpjEqUrl/refreshMasaMenunggu/";

  Map<String, String> formHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  final int maxFileUploadSize = 20000000;

  String jpjEbidAppStoreid = '1458846863';
  String jpjEbidPlayStoreid = 'my.gov.jpj.ebidding';
  String jpjEqAppStoreid = '1545069171';
  String jpjEqPlayStoreid = 'my.gov.jpj.queue';
  String eHadirAppStoreid = '1468511154';
  String eHadirPlayStoreid = 'my.gov.jpj.mykedatangan';
  String eHadirKey = 'jpjit2020';
  // String oneSignalAppId = "214eeb2e-e4b5-4ccf-b3f6-bb118bee513f";
  String oneSignalAppId = "bbf1b5f8-4d3a-4405-9d55-3937ff588b6a"; // jpj

  Future<JpjEqRequestToken> getJpjEqToken() async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    // String imeiNo = await DeviceInformation.deviceIMEINumber;
    String imeiNo = '';
    SharedPreferences pref = await SharedPreferences.getInstance();
    imeiNo =
        pref.getString(LocalStorageHelper().jpjOneSignalPlayerId) ?? imeiNo;
    String token = '';
    String value = imeiNo + timestamp + eHadirKey;

    var raw = SHA256().update(utf8.encode(value)).digest();
    for (var el in raw) {
      token += el.toRadixString(16).padLeft(2, '0');
    }
    JpjEqRequestToken retVal = JpjEqRequestToken(
      date: timestamp,
      imei: imeiNo,
      token: token,
    );

    return retVal;
  }
}
