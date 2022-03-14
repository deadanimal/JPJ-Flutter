class LocationCheckResponse {
  List<Data>? data;

  LocationCheckResponse({data});

  LocationCheckResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach(
        (v) {
          data!.add(Data.fromJson(v));
        },
      );
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
  String? idnegeri;
  String? nama;
  String? alamat;
  String? nofon;
  String? nofaks;
  String? koordinat;
  String? koordinat2;

  Data({
    id,
    idnegeri,
    nama,
    alamat,
    nofon,
    nofaks,
    koordinat,
    koordinat2,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idnegeri = json['idnegeri'];
    nama = json['nama'];
    alamat = json['alamat'];
    nofon = json['nofon'];
    nofaks = json['nofaks'];
    koordinat = json['koordinat'];
    koordinat2 = json['koordinat2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idnegeri'] = idnegeri;
    data['nama'] = nama;
    data['alamat'] = alamat;
    data['nofon'] = nofon;
    data['nofaks'] = nofaks;
    data['koordinat'] = koordinat;
    data['koordinat2'] = koordinat2;
    return data;
  }
}
