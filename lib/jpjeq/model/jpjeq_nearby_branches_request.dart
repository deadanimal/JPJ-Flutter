class JpjEqNearbyBranchesRequest {
  String? playerId;
  String? tarikh;
  String? token;
  double? lat;
  double? lng;

  JpjEqNearbyBranchesRequest({
    this.playerId,
    this.tarikh,
    this.token,
    this.lat,
    this.lng,
  });

  JpjEqNearbyBranchesRequest.fromJson(Map<String, dynamic> json) {
    playerId = json['player_id'];
    tarikh = json['tarikh'];
    token = json['token'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['player_id'] = playerId;
    data['tarikh'] = tarikh;
    data['token'] = token;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}
