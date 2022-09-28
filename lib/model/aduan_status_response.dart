class AduanStatusResponse {
  String? nokpPengadu;
  String? noAduan;
  int? status;
  int? id;
  String? keteranganStatus;
  int? sendFlag;
  String? tarikh;

  AduanStatusResponse({
    this.nokpPengadu,
    this.noAduan,
    this.status,
    this.id,
    this.keteranganStatus,
    this.sendFlag,
    this.tarikh,
  });

  AduanStatusResponse.fromJson(Map<String, dynamic> json) {
    nokpPengadu = json['nokp_pengadu'];
    noAduan = json['no_aduan'];
    status = json['status'];
    id = json['id'];
    keteranganStatus = json['keterangan_status'];
    sendFlag = json['send_flag'];
    tarikh = json['tarikh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp_pengadu'] = nokpPengadu;
    data['no_aduan'] = noAduan;
    data['status'] = status;
    data['id'] = id;
    data['keterangan_status'] = keteranganStatus;
    data['send_flag'] = sendFlag;
    data['tarikh'] = tarikh;
    return data;
  }
}
