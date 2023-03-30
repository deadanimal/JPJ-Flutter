class JpjEqRefreshWaitingTimeResponse {
  String? noSekarang;
  int? masaMenunggu;
  String? cawangan;
  int? kedudukanMenunggu;
  String? sesiTiket;
  String? sesi;

  JpjEqRefreshWaitingTimeResponse({
    this.noSekarang,
    this.masaMenunggu,
    this.cawangan,
    this.kedudukanMenunggu,
    this.sesiTiket,
    this.sesi,
  });

  JpjEqRefreshWaitingTimeResponse.fromJson(Map<String, dynamic> json) {
    noSekarang = json['no_sekarang'];
    masaMenunggu = json['masa_menunggu'];
    cawangan = json['cawangan'];
    kedudukanMenunggu = json['kedudukan_menunggu'];
    sesiTiket = json['sesiTiket'];
    sesi = json['sesi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_sekarang'] = noSekarang;
    data['masa_menunggu'] = masaMenunggu;
    data['cawangan'] = cawangan;
    data['kedudukan_menunggu'] = kedudukanMenunggu;
    data['sesiTiket'] = sesiTiket;
    data['sesi'] = sesi;
    return data;
  }
}
