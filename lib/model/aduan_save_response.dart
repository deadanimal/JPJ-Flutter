class AduanSaveResponse {
  String? status;
  StatusSave? statusSave;
  FileUpload? fileUpload;
  int? noAduan;

  AduanSaveResponse({
    this.status,
    this.statusSave,
    this.fileUpload,
    this.noAduan,
  });

  AduanSaveResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusSave = json['status_save'] != null
        ? StatusSave.fromJson(json['status_save'])
        : null;
    fileUpload = json['file_upload'] != null
        ? FileUpload.fromJson(json['file_upload'])
        : null;
    noAduan = json['no_aduan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (statusSave != null) {
      data['status_save'] = statusSave!.toJson();
    }
    if (fileUpload != null) {
      data['file_upload'] = fileUpload!.toJson();
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
  String? filePath;
  String? updatedAt;
  String? createdAt;
  int? id;

  StatusSave({
    this.noAduan,
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
    this.filePath,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

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
    filePath = json['file_path'];
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
    data['file_path'] = filePath;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class FileUpload {
  dynamic upload;
  String? type;
  String? size;
  String? file;

  FileUpload({
    this.upload,
    this.type,
    this.size,
    this.file,
  });

  FileUpload.fromJson(Map<String, dynamic> json) {
    upload = json['upload'];
    type = json['type'];
    size = json['size'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['upload'] = upload;
    data['type'] = type;
    data['size'] = size;
    data['file'] = file;
    return data;
  }
}
