class ComitteeListRes {
  int? id;
  String? transidAktiviti;
  String? urusetia;
  String? createBy;
  int? idAktiviti;
  String? createdAt;
  String? updatedAt;
  String? nama;
  String? namabahagian;
  String? nokp;

  ComitteeListRes({
    this.id,
    this.transidAktiviti,
    this.urusetia,
    this.createBy,
    this.idAktiviti,
    this.createdAt,
    this.updatedAt,
    this.nama,
    this.namabahagian,
    this.nokp,
  });

  ComitteeListRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transidAktiviti = json['transid_aktiviti'];
    urusetia = json['urusetia'];
    createBy = json['create_by'];
    idAktiviti = json['id_aktiviti'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nama = json['nama'];
    namabahagian = json['namabahagian'];
    nokp = json['nokp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transid_aktiviti'] = transidAktiviti;
    data['urusetia'] = urusetia;
    data['create_by'] = createBy;
    data['id_aktiviti'] = idAktiviti;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['nama'] = nama;
    data['namabahagian'] = namabahagian;
    data['nokp'] = nokp;
    return data;
  }
}
