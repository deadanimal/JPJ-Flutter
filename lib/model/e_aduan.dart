class EAduan {
  int? id;
  String? noAduan;
  String? pengadu;
  int? jenisKesalahan;
  String? tarikhKesalahan;
  String? masaKesalahan;
  String? lokasiKesalahan;
  String? longitude;
  String? latitude;
  String? noKenderaan;
  String? namaFail;
  String? pautan;
  String? jenisMedia;
  int? statusAduan;
  String? negeri;
  String? kodNegeri;
  String? kodCawangan;
  String? catatan;
  String? deviceId;
  String? onesignalId;
  String? deleteDate;
  int? sendFlag;
  String? updateBy;

  EAduan({
    this.id,
    this.noAduan,
    this.pengadu,
    this.jenisKesalahan,
    this.tarikhKesalahan,
    this.masaKesalahan,
    this.lokasiKesalahan,
    this.longitude,
    this.latitude,
    this.noKenderaan,
    this.namaFail,
    this.pautan,
    this.jenisMedia,
    this.statusAduan,
    this.negeri,
    this.kodNegeri,
    this.kodCawangan,
    this.catatan,
    this.deviceId,
    this.onesignalId,
    this.deleteDate,
    this.sendFlag,
    this.updateBy,
  });

  EAduan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noAduan = json['no_aduan'];
    pengadu = json['pengadu'];
    jenisKesalahan = json['jenis_kesalahan'];
    tarikhKesalahan = json['tarikh_kesalahan'];
    masaKesalahan = json['masa_kesalahan'];
    lokasiKesalahan = json['lokasi_kesalahan'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    noKenderaan = json['no_kenderaan'];
    namaFail = json['nama_fail'];
    pautan = json['pautan'];
    jenisMedia = json['jenis_media'];
    statusAduan = json['status_aduan'];
    negeri = json['negeri'];
    kodNegeri = json['kod_negeri'];
    kodCawangan = json['kod_cawangan'];
    catatan = json['catatan'];
    deviceId = json['device_id'];
    onesignalId = json['onesignal_id'];
    deleteDate = json['delete_date'];
    sendFlag = json['send_flag'];
    updateBy = json['update_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['no_aduan'] = noAduan;
    data['pengadu'] = pengadu;
    data['jenis_kesalahan'] = jenisKesalahan;
    data['tarikh_kesalahan'] = tarikhKesalahan;
    data['masa_kesalahan'] = masaKesalahan;
    data['lokasi_kesalahan'] = lokasiKesalahan;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['no_kenderaan'] = noKenderaan;
    data['nama_fail'] = namaFail;
    data['pautan'] = pautan;
    data['jenis_media'] = jenisMedia;
    data['status_aduan'] = statusAduan;
    data['negeri'] = negeri;
    data['kod_negeri'] = kodNegeri;
    data['kod_cawangan'] = kodCawangan;
    data['catatan'] = catatan;
    data['device_id'] = deviceId;
    data['onesignal_id'] = onesignalId;
    data['delete_date'] = deleteDate;
    data['send_flag'] = sendFlag;
    data['update_by'] = updateBy;
    return data;
  }
}
