class SiteConfig {
  static String url = "http://egate.jpj.gov.my";
  static String prodUrl = "https://myjpj.jpj.gov.my";
  static String appStoreUrl = 'itms-apps://apps.apple.com/us/app';
  static String playStoreUrl = 'market://details?id';
  static String stagingUrl = "https://api.caravel.space/jpj";
  // static String stagingUrl = "10.180.4.94/api";

  // account api
  final String loginUri = "$prodUrl/aduantrafikmobile/login/processlogin2";
  final String getNotificationUri = "$url/jpj-api/apps/getNotification";
  final String updateProfileUri = "$url/jpj-api/apps/kemaskiniprofile";
  final String changePasswordUri = "$url/myjpj-api-dev/apps/kemaskiniprofile";
  final String resetPasswordUri = "$url/myjpj-api-dev/apps/resetkatalaluan";
  final String checkUserUri = "$url/jpj-api/login/checkUser";
  final String registerUserUri = "$url/jpj-api/login/register";

  // existing jpj info api
  // final String blacklistCheckUri = "$url/jpjinfo-api/apps/semaksenaraihitam";
  // final String demeritCheckUri = "$url/jpjinfo-api/apps/semakmatademerit";
  // final String licenseCheckUri = "$url/jpjinfo-api/apps/semakstatuslesen";
  // final String roadTaxCheckUri = "$url/jpjinfo-api/apps/semakcukaijalan";
  // final String testResultUri = "$url/jpjinfo-api/apps/semakkeputusanujian";
  // final String locationCheckUri = "$url/jpjinfo-api/apps/semaklokasi";
  // final String plateNumberUri = "$url/jpjinfo-api/apps/semaknopendaftaran";

  // new jpj api
  final String locationCheckUri = "$prodUrl/jpjinfo-api/apps/semaklokasi";
  final String plateNumberUri = "$prodUrl/jpjinfo-api/apps/semaknopendaftaran";
  final String roadTaxCheckUri = "$prodUrl/jpjinfo-api/apps/semakcukaijalan";
  final String summonCheckUri = "$prodUrl/saman_api/samanapps/inquirisaman";
  final String licenseCheckUri = "$prodUrl/jpjinfo-api/apps/semakstatuslesen";
  final String testResultUri = "$prodUrl/jpjinfo-api/apps/semakkeputusanujian";
  final String blacklistCheckUri =
      "$prodUrl/jpjinfo-api/apps/semaksenaraihitam";
  final String demeritCheckUri = "$prodUrl/jpjinfo-api/apps/semakmatademerit";

  //staging api
  final String checkUserIdUri = "$stagingUrl/semak-id-awam/";
  final String checkUserIdUrierr = "$stagingUrl/semak-id-awam/err.php";
  final String registrationUri = "$stagingUrl/register_id_awam/";

  // other api
  final String feedbackUri = "$url/myjpj-api-dev/apps/maklumbalas";

  //todo: change to use actual URL
  final String summonsCheckUri = "http://test.caravel.space/summons.php";

  Map<String, String> jsonHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Map<String, String> formHeader = {
    'Content-Type': 'multipart/form-data; charset=UTF-8',
  };

  String jpjEbidAppStoreid = '1458846863';
  String jpjEbidPlayStoreid = 'my.gov.jpj.ebidding';
  String jpjEqAppStoreid = '1545069171';
  String jpjEqPlayStoreid = 'my.gov.jpj.queue';
}
