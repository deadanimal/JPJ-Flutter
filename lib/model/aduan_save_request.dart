class AduanSaveRequest {
  String? idkesalahan;
  String? tarikh;
  String? masa;
  String? lokasi;
  String? latitude;
  String? longlitude;
  String? nokenderaan;
  String? catatan;
  String? pengadu;
  String? negeri;
  String? pautan;
  String? imageName;
  String? videoName;
  String? onesignalId;

  AduanSaveRequest(
      {this.idkesalahan,
      this.tarikh,
      this.masa,
      this.lokasi,
      this.latitude,
      this.longlitude,
      this.nokenderaan,
      this.catatan,
      this.pengadu,
      this.negeri,
      this.pautan,
      this.imageName,
      this.videoName,
      this.onesignalId});

  AduanSaveRequest.fromJson(Map<String, dynamic> json) {
    idkesalahan = json['idkesalahan'];
    tarikh = json['tarikh'];
    masa = json['masa'];
    lokasi = json['lokasi'];
    latitude = json['latitude'];
    longlitude = json['longlitude'];
    nokenderaan = json['nokenderaan'];
    catatan = json['catatan'];
    pengadu = json['pengadu'];
    negeri = json['negeri'];
    pautan = json['pautan'];
    imageName = json['image_name'];
    videoName = json['video_name'];
    onesignalId = json['onesignal_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idkesalahan'] = idkesalahan;
    data['tarikh'] = tarikh;
    data['masa'] = masa;
    data['lokasi'] = lokasi;
    data['latitude'] = latitude;
    data['longlitude'] = longlitude;
    data['nokenderaan'] = nokenderaan;
    data['catatan'] = catatan;
    data['pengadu'] = pengadu;
    data['negeri'] = negeri;
    data['pautan'] = pautan;
    data['image_name'] = imageName;
    data['video_name'] = videoName;
    data['onesignal_id'] = onesignalId;
    return data;
  }
}
