class NewActivityReq {
  String? nokp;
  String? bilanganHari;
  String? lokasi;
  String? keterangan;
  String? nama;
  String? bilanganSesi;
  String? tarikhMula;
  String? tarikhTamat;
  String? latitude;
  String? longitude;
  String? masaMula4;
  String? masaTamat4;
  String? masaMula1;
  String? masaTamat1;
  String? masaMula2;
  String? masaTamat2;
  String? masaMula3;
  String? masaTamat3;
  int? idAktiviti;

  NewActivityReq({
    this.nokp,
    this.bilanganHari,
    this.lokasi,
    this.keterangan,
    this.nama,
    this.bilanganSesi,
    this.tarikhMula,
    this.tarikhTamat,
    this.latitude,
    this.longitude,
    this.masaMula4,
    this.masaTamat4,
    this.masaMula1,
    this.masaTamat1,
    this.masaMula2,
    this.masaTamat2,
    this.masaMula3,
    this.masaTamat3,
    this.idAktiviti,
  });

  NewActivityReq.fromJson(Map<String, dynamic> json) {
    nokp = json['nokp'];
    bilanganHari = json['bilangan_hari'];
    lokasi = json['lokasi'];
    keterangan = json['keterangan'];
    nama = json['nama'];
    bilanganSesi = json['bilangan_sesi'];
    tarikhMula = json['tarikh_mula'];
    tarikhTamat = json['tarikh_tamat'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    masaMula4 = json['masa_mula4'];
    masaTamat4 = json['masa_tamat4'];
    masaMula1 = json['masa_mula1'];
    masaTamat1 = json['masa_tamat1'];
    masaMula2 = json['masa_mula2'];
    masaTamat2 = json['masa_tamat2'];
    masaMula3 = json['masa_mula3'];
    masaTamat3 = json['masa_tamat3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['bilangan_hari'] = bilanganHari;
    data['lokasi'] = lokasi;
    data['keterangan'] = keterangan;
    data['nama'] = nama;
    data['bilangan_sesi'] = bilanganSesi;
    data['tarikh_mula'] = tarikhMula;
    data['tarikh_tamat'] = tarikhTamat;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['masa_mula4'] = masaMula4;
    data['masa_tamat4'] = masaTamat4;
    data['masa_mula1'] = masaMula1;
    data['masa_tamat1'] = masaTamat1;
    data['masa_mula2'] = masaMula2;
    data['masa_tamat2'] = masaTamat2;
    data['masa_mula3'] = masaMula3;
    data['masa_tamat3'] = masaTamat3;
    data['id_aktiviti'] = idAktiviti;
    return data;
  }
}
