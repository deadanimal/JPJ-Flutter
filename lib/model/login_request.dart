class LoginRequest {
  String? username;
  String? katalaluan;
  String? uuid;
  String? playerid;

  LoginRequest({this.username, this.katalaluan, this.uuid, this.playerid});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    katalaluan = json['katalaluan'];
    uuid = json['uuid'];
    playerid = json['playerid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['katalaluan'] = katalaluan;
    data['uuid'] = uuid;
    data['playerid'] = playerid;
    return data;
  }
}
