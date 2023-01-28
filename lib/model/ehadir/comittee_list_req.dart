class ComitteeListReq {
  int? idAktiviti;

  ComitteeListReq({
    this.idAktiviti,
  });

  ComitteeListReq.fromJson(Map<String, dynamic> json) {
    idAktiviti = json['id_aktiviti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_aktiviti'] = idAktiviti;
    return data;
  }
}
