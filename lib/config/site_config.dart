class SiteConfig {
  static String url = "http://egate.jpj.gov.my";
  final String blacklistCheckUri = url + "/jpjinfo-api/apps/semaksenaraihitam";
  final String demeritCheckUri = url + "/jpjinfo-api/apps/semakmatademerit";
  final String licenseCheckUri = url + "/jpjinfo-api/apps/semakstatuslesen";
  final String roadTaxCheckUri = url + "/jpjinfo-api/apps/semakcukaijalan";
  final String testResultUri = url + "/jpjinfo-api/apps/semakkeputusanujian";
  final String registrationCheckUri =
      url + "/jpjinfo-api/apps/semaknopendaftaran";
  final String locationCheckUri = url + "/jpjinfo-api/apps/semaklokasi";
  final String plateNumberUri = url + "/jpjinfo-api/apps/semaknopendaftaran";

  //todo: change to use actual URL
  final String summonsCheckUri = "http://test.caravel.space/summons.php";
  final String registrationUri = "http://test.caravel.space/rest/register.php";

  Map<String, String> jsonHeader = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
}
