class AttendingActivityListRes {
  int? id;
  String? transidAktiviti;
  String? transidSesi;
  String? namaAktiviti;
  String? tarikh;
  String? masa;
  String? tarikhMula;
  String? tarikhTamat;
  String? masaMula;
  String? masaTamat;
  int? bilanganHari;
  int? bilanganSesi;
  String? lokasi;
  String? latitude;
  String? longitude;
  String? keterangan;
  String? penganjur;
  String? urusetiaId;
  String? namafail;
  String? status;
  String? createdAt;
  String? createBy;
  String? updateBy;
  String? updatedAt;
  String? nokp;
  int? isurusetia;

  AttendingActivityListRes({
    this.id,
    this.transidAktiviti,
    this.transidSesi,
    this.namaAktiviti,
    this.tarikh,
    this.masa,
    this.tarikhMula,
    this.tarikhTamat,
    this.masaMula,
    this.masaTamat,
    this.bilanganHari,
    this.bilanganSesi,
    this.lokasi,
    this.latitude,
    this.longitude,
    this.keterangan,
    this.penganjur,
    this.urusetiaId,
    this.namafail,
    this.status,
    this.createdAt,
    this.createBy,
    this.updateBy,
    this.updatedAt,
    this.nokp,
    this.isurusetia,
  });

  AttendingActivityListRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transidAktiviti = json['transid_aktiviti'];
    transidSesi = json['transid_sesi'];
    namaAktiviti = json['nama_aktiviti'];
    tarikh = json['tarikh'];
    masa = json['masa'];
    tarikhMula = json['tarikh_mula'];
    tarikhTamat = json['tarikh_tamat'];
    masaMula = json['masa_mula'];
    masaTamat = json['masa_tamat'];
    bilanganHari = json['bilangan_hari'];
    bilanganSesi = json['bilangan_sesi'];
    lokasi = json['lokasi'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    keterangan = json['keterangan'];
    penganjur = json['penganjur'];
    urusetiaId = json['urusetia_id'];
    namafail = json['namafail'];
    status = json['status'];
    createdAt = json['created_at'];
    createBy = json['create_by'];
    updateBy = json['update_by'];
    updatedAt = json['updated_at'];
    nokp = json['nokp'];
    isurusetia = json['isurusetia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transid_aktiviti'] = transidAktiviti;
    data['transid_sesi'] = transidSesi;
    data['nama_aktiviti'] = namaAktiviti;
    data['tarikh'] = tarikh;
    data['masa'] = masa;
    data['tarikh_mula'] = tarikhMula;
    data['tarikh_tamat'] = tarikhTamat;
    data['masa_mula'] = masaMula;
    data['masa_tamat'] = masaTamat;
    data['bilangan_hari'] = bilanganHari;
    data['bilangan_sesi'] = bilanganSesi;
    data['lokasi'] = lokasi;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['keterangan'] = keterangan;
    data['penganjur'] = penganjur;
    data['urusetia_id'] = urusetiaId;
    data['namafail'] = namafail;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['create_by'] = createBy;
    data['update_by'] = updateBy;
    data['updated_at'] = updatedAt;
    data['nokp'] = nokp;
    data['isurusetia'] = isurusetia;
    return data;
  }
}
