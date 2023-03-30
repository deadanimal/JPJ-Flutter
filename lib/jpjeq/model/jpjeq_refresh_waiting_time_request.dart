class JpjEqRefreshWaitingTimeRequest {
  String? idKumpulanPerkhidmatan;
  String? cawangan;
  String? tarikh;
  String? playerId;
  String? noSiri;
  String? token;

  JpjEqRefreshWaitingTimeRequest({
    this.idKumpulanPerkhidmatan,
    this.cawangan,
    this.tarikh,
    this.playerId,
    this.noSiri,
    this.token,
  });

  JpjEqRefreshWaitingTimeRequest.fromJson(Map<String, dynamic> json) {
    idKumpulanPerkhidmatan = json['id_kumpulan_perkhidmatan'];
    cawangan = json['cawangan'];
    tarikh = json['tarikh'];
    playerId = json['player_id'];
    noSiri = json['no_siri'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_kumpulan_perkhidmatan'] = idKumpulanPerkhidmatan;
    data['cawangan'] = cawangan;
    data['tarikh'] = tarikh;
    data['player_id'] = playerId;
    data['no_siri'] = noSiri;
    data['token'] = token;
    return data;
  }
}
