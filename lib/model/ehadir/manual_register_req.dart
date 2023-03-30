class ManualRegisterReq {
  String? nokp;
  int? idAktiviti;
  String? userId;
  String? jenis;
  String? transidAktiviti;
  String? transidSesi;

  ManualRegisterReq({
    this.nokp,
    this.jenis,
    this.idAktiviti,
    this.transidAktiviti,
    this.transidSesi,
    this.userId,
  });

  ManualRegisterReq.fromJson(Map<String, dynamic> json) {
    nokp = json['nokp'];
    idAktiviti = json['id_aktiviti'];
    jenis = json['jenis'];
    transidAktiviti = json['transid_aktiviti'];
    nokp = json['nokp'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_aktiviti'] = idAktiviti;
    // data['jenis'] = jenis;
    data['nokp'] = nokp;
    data['transid_aktiviti'] = transidAktiviti;
    data['transid_sesi'] = transidSesi;
    data['user_id'] = userId;
    return data;
  }
}
