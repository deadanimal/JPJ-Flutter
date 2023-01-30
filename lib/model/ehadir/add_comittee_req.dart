class AddComitteeReq {
  int? idAktiviti;
  String? nokp;
  String? transidAktiviti;

  AddComitteeReq({
    this.idAktiviti,
    this.nokp,
    this.transidAktiviti,
  });

  AddComitteeReq.fromJson(Map<String, dynamic> json) {
    idAktiviti = json['id_aktiviti'];
    nokp = json['nokp'];
    transidAktiviti = json['transid_aktiviti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_aktiviti'] = idAktiviti;
    data['nokp'] = nokp;
    data['transid_aktiviti'] = transidAktiviti;
    return data;
  }
}
