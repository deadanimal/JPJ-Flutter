class JpjEqServiceGroupRequest {
  String? param;
  String? playerId;
  String? tarikh;
  String? token;

  JpjEqServiceGroupRequest({
    this.param,
    this.playerId,
    this.tarikh,
    this.token,
  });

  JpjEqServiceGroupRequest.fromJson(Map<String, dynamic> json) {
    param = json['param'];
    playerId = json['player_id'];
    tarikh = json['tarikh'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['param'] = param;
    data['player_id'] = playerId;
    data['tarikh'] = tarikh;
    data['token'] = token;
    return data;
  }
}
