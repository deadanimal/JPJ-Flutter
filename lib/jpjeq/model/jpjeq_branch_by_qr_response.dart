class JpjEqGetBrancheByQrResponse {
  List<Data>? data;

  JpjEqGetBrancheByQrResponse({this.data});

  JpjEqGetBrancheByQrResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? idCawangan;
  String? namaCawangan;
  String? selaMasa;
  String? kodQR;

  Data({
    this.id,
    this.idCawangan,
    this.namaCawangan,
    this.selaMasa,
    this.kodQR,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCawangan = json['id_cawangan'];
    namaCawangan = json['nama_cawangan'];
    selaMasa = json['sela_masa'];
    kodQR = json['kodQR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_cawangan'] = idCawangan;
    data['nama_cawangan'] = namaCawangan;
    data['sela_masa'] = selaMasa;
    data['kodQR'] = kodQR;
    return data;
  }
}
