class ChangeTempPasswordRequest {
  String? katalaluanBaru;
  String? nokp;

  ChangeTempPasswordRequest({this.katalaluanBaru, this.nokp});

  ChangeTempPasswordRequest.fromJson(Map<String, dynamic> json) {
    katalaluanBaru = json['katalaluan_baru'];
    nokp = json['nokp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['katalaluan_baru'] = katalaluanBaru;
    data['nokp'] = nokp;
    return data;
  }
}
