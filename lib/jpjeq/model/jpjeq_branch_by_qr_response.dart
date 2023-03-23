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
  int? selaMasa;

  Data({this.selaMasa});

  Data.fromJson(Map<String, dynamic> json) {
    selaMasa = json['sela_masa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sela_masa'] = selaMasa;
    return data;
  }
}
