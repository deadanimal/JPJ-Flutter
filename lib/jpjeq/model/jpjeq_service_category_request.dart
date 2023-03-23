class ServiceCategoryRequest {
  String? cawangan;
  String? playerId;
  String? tarikh;
  String? token;

  ServiceCategoryRequest({
    this.cawangan,
    this.playerId,
    this.tarikh,
    this.token,
  });

  ServiceCategoryRequest.fromJson(Map<String, dynamic> json) {
    cawangan = json['cawangan'];
    playerId = json['player_id'];
    tarikh = json['tarikh'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cawangan'] = cawangan;
    data['player_id'] = playerId;
    data['tarikh'] = tarikh;
    data['token'] = token;
    return data;
  }
}
