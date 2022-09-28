class AduanSaveResponse {
  String? status;
  StatusSave? statusSave;
  int? noAduan;

  AduanSaveResponse({this.status, this.statusSave, this.noAduan});

  AduanSaveResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusSave = json['status_save'] != null
        ? StatusSave.fromJson(json['status_save'])
        : null;
    noAduan = json['no_aduan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (statusSave != null) {
      data['status_save'] = statusSave!.toJson();
    }
    data['no_aduan'] = noAduan;
    return data;
  }
}

class StatusSave {
  int? noAduan;
  String? jenisKesalahan;
  String? tarikhKesalahan;
  String? masaKesalahan;
  String? lokasiKesalahan;
  String? latitude;
  String? longitude;
  String? noKenderaan;
  String? catatan;
  String? pengadu;
  String? namaFail;
  String? negeri;
  String? jenisMedia;
  String? deviceId;
  int? statusAduan;
  String? kodNegeri;
  String? pautan;
  String? onesignalId;
  String? updatedAt;
  String? createdAt;
  int? id;

  StatusSave(
      {this.noAduan,
      this.jenisKesalahan,
      this.tarikhKesalahan,
      this.masaKesalahan,
      this.lokasiKesalahan,
      this.latitude,
      this.longitude,
      this.noKenderaan,
      this.catatan,
      this.pengadu,
      this.namaFail,
      this.negeri,
      this.jenisMedia,
      this.deviceId,
      this.statusAduan,
      this.kodNegeri,
      this.pautan,
      this.onesignalId,
      this.updatedAt,
      this.createdAt,
      this.id});

  StatusSave.fromJson(Map<String, dynamic> json) {
    noAduan = json['no_aduan'];
    jenisKesalahan = json['jenis_kesalahan'];
    tarikhKesalahan = json['tarikh_kesalahan'];
    masaKesalahan = json['masa_kesalahan'];
    lokasiKesalahan = json['lokasi_kesalahan'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    noKenderaan = json['no_kenderaan'];
    catatan = json['catatan'];
    pengadu = json['pengadu'];
    namaFail = json['nama_fail'];
    negeri = json['negeri'];
    jenisMedia = json['jenis_media'];
    deviceId = json['device_id'];
    statusAduan = json['status_aduan'];
    kodNegeri = json['kod_negeri'];
    pautan = json['pautan'];
    onesignalId = json['onesignal_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_aduan'] = noAduan;
    data['jenis_kesalahan'] = jenisKesalahan;
    data['tarikh_kesalahan'] = tarikhKesalahan;
    data['masa_kesalahan'] = masaKesalahan;
    data['lokasi_kesalahan'] = lokasiKesalahan;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['no_kenderaan'] = noKenderaan;
    data['catatan'] = catatan;
    data['pengadu'] = pengadu;
    data['nama_fail'] = namaFail;
    data['negeri'] = negeri;
    data['jenis_media'] = jenisMedia;
    data['device_id'] = deviceId;
    data['status_aduan'] = statusAduan;
    data['kod_negeri'] = kodNegeri;
    data['pautan'] = pautan;
    data['onesignal_id'] = onesignalId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
