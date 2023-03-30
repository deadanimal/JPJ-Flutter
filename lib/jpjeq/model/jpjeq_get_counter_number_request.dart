class JpjEqGetCounterNumberRequest {
  String? transid;
  String? cawangan;
  String? playerId;
  String? tarikh;
  String? token;

  JpjEqGetCounterNumberRequest({
    this.transid,
    this.cawangan,
    this.playerId,
    this.tarikh,
    this.token,
  });

  JpjEqGetCounterNumberRequest.fromJson(Map<String, dynamic> json) {
    transid = json['transid'];
    cawangan = json['cawangan'];
    playerId = json['player_id'];
    tarikh = json['tarikh'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transid'] = transid;
    data['cawangan'] = cawangan;
    data['player_id'] = playerId;
    data['tarikh'] = tarikh;
    data['token'] = token;
    return data;
  }
}
