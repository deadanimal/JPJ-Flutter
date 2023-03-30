class EditActivityReq {
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
  int? idAktiviti;
  List<Sesi>? sesi;

  EditActivityReq({
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
    this.idAktiviti,
    this.sesi,
  });

  EditActivityReq.fromJson(Map<String, dynamic> json) {
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
    if (json['sesi'] != null) {
      sesi = <Sesi>[];
      json['sesi'].forEach((v) {
        sesi!.add(Sesi.fromJson(v));
      });
    }
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
    data['id_aktiviti'] = idAktiviti;
    if (sesi != null) {
      data['sesi'] = sesi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sesi {
  String? masaMula;
  String? masaTamat;

  Sesi({this.masaMula, this.masaTamat});

  Sesi.fromJson(Map<String, dynamic> json) {
    masaMula = json['masa_mula'];
    masaTamat = json['masa_tamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['masa_mula'] = masaMula;
    data['masa_tamat'] = masaTamat;
    return data;
  }
}
