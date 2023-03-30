class JpjEqGetCounterNumberResponse {
  int? status;
  String? msg;
  String? noTiket;
  String? kaunter;

  JpjEqGetCounterNumberResponse({
    this.status,
    this.msg,
    this.noTiket,
    this.kaunter,
  });

  JpjEqGetCounterNumberResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    noTiket = json['no_tiket'];
    kaunter = json['kaunter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['no_tiket'] = noTiket;
    data['kaunter'] = kaunter;
    return data;
  }
}
