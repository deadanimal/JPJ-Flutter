class ChangePasswordRequest {
  String? nokp;
  String? katalaluanBaru;

  ChangePasswordRequest({
    this.nokp,
    this.katalaluanBaru,
  });

  ChangePasswordRequest.fromJson(Map<String, dynamic> json) {
    nokp = json['nokp'];
    katalaluanBaru = json['katalaluan_baru'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['katalaluan_baru'] = katalaluanBaru;
    return data;
  }
}
