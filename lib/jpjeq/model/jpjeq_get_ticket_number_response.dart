class JpjEqGetTicketNumberResponse {
  String? status;
  String? mesej;
  String? noTiketAnda;
  String? noSekarang;
  int? masaMenunggu;
  int? kedudukanMenunggu;
  String? noSiri;
  String? transid;
  String? cawangan;
  String? sesi;
  String? waktuMula;
  String? waktuTamat;

  JpjEqGetTicketNumberResponse({
    this.status,
    this.mesej,
    this.noTiketAnda,
    this.noSekarang,
    this.masaMenunggu,
    this.kedudukanMenunggu,
    this.noSiri,
    this.transid,
    this.cawangan,
    this.sesi,
    this.waktuMula,
    this.waktuTamat,
  });

  JpjEqGetTicketNumberResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mesej = json['mesej'];
    noTiketAnda = json['no_tiket_anda'];
    noSekarang = json['no_sekarang'];
    masaMenunggu = json['masa_menunggu'];
    kedudukanMenunggu = json['kedudukan_menunggu'];
    noSiri = json['no_siri'];
    transid = json['transid'];
    cawangan = json['cawangan'];
    sesi = json['sesi'];
    waktuMula = json['waktuMula'];
    waktuTamat = json['waktuTamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['mesej'] = mesej;
    data['no_tiket_anda'] = noTiketAnda;
    data['no_sekarang'] = noSekarang;
    data['masa_menunggu'] = masaMenunggu;
    data['kedudukan_menunggu'] = kedudukanMenunggu;
    data['no_siri'] = noSiri;
    data['transid'] = transid;
    data['cawangan'] = cawangan;
    data['sesi'] = sesi;
    data['waktuMula'] = waktuMula;
    data['waktuTamat'] = waktuTamat;
    return data;
  }
}
