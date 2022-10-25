class AduanUpdateResponse {
  String? status;
  StatusSave? statusSave;

  AduanUpdateResponse({
    this.status,
    this.statusSave,
  });

  AduanUpdateResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusSave = json['status_save'] != null
        ? StatusSave.fromJson(json['status_save'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (statusSave != null) {
      data['status_save'] = statusSave!.toJson();
    }
    return data;
  }
}

class StatusSave {
  int? id;
  String? noAduan;
  String? pengadu;
  String? phone;
  String? jenisKesalahan;
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
  String? filePath;
  String? deviceId;
  String? onesignalId;
  String? deleteDate;
  int? sendFlag;
  String? createdAt;
  String? updatedAt;
  String? updateBy;

  StatusSave({
    this.id,
    this.noAduan,
    this.pengadu,
    this.phone,
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
    this.filePath,
    this.deviceId,
    this.onesignalId,
    this.deleteDate,
    this.sendFlag,
    this.createdAt,
    this.updatedAt,
    this.updateBy,
  });

  StatusSave.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noAduan = json['no_aduan'];
    pengadu = json['pengadu'];
    phone = json['phone'];
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
    filePath = json['file_path'];
    deviceId = json['device_id'];
    onesignalId = json['onesignal_id'];
    deleteDate = json['delete_date'];
    sendFlag = json['send_flag'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    updateBy = json['update_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['no_aduan'] = noAduan;
    data['pengadu'] = pengadu;
    data['phone'] = phone;
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
    data['file_path'] = filePath;
    data['device_id'] = deviceId;
    data['onesignal_id'] = onesignalId;
    data['delete_date'] = deleteDate;
    data['send_flag'] = sendFlag;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['update_by'] = updateBy;
    return data;
  }
}
