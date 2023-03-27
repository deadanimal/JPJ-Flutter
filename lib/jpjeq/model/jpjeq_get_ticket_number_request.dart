class JpjEqGetTicketNumberRequest {
  String? playerId;
  String? tarikh;
  String? token;
  int? idKumpulanPerkhidmatan;
  String? param;
  String? cawangan;

  JpjEqGetTicketNumberRequest({
    this.playerId,
    this.tarikh,
    this.token,
    this.idKumpulanPerkhidmatan,
    this.param,
    this.cawangan,
  });

  JpjEqGetTicketNumberRequest.fromJson(Map<String, dynamic> json) {
    playerId = json['player_id'];
    tarikh = json['tarikh'];
    token = json['token'];
    idKumpulanPerkhidmatan = json['id_kumpulan_perkhidmatan'];
    param = json['param'];
    cawangan = json['cawangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['player_id'] = playerId;
    data['tarikh'] = tarikh;
    data['token'] = token;
    data['id_kumpulan_perkhidmatan'] = idKumpulanPerkhidmatan;
    data['param'] = param;
    data['cawangan'] = cawangan;
    return data;
  }
}
