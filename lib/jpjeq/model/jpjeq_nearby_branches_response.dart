class JpjEqNearbyBranchesResponse {
  List<JpjBranchData>? data;

  JpjEqNearbyBranchesResponse({this.data});

  JpjEqNearbyBranchesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <JpjBranchData>[];
      json['data'].forEach((v) {
        data!.add(JpjBranchData.fromJson(v));
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

class JpjBranchData {
  String? idCawangan;
  String? namaCawangan;
  String? latitud;
  String? longitud;
  String? alamat1;
  String? alamat2;
  String? alamat3;
  String? alamat4;
  String? daerah;
  String? noTelefon;
  String? noFaks;
  String? negeri;
  String? kodQR;
  String? radius;
  String? distance;

  JpjBranchData({
    this.idCawangan,
    this.namaCawangan,
    this.latitud,
    this.longitud,
    this.alamat1,
    this.alamat2,
    this.alamat3,
    this.alamat4,
    this.daerah,
    this.noTelefon,
    this.noFaks,
    this.negeri,
    this.kodQR,
    this.radius,
    this.distance,
  });

  JpjBranchData.fromJson(Map<String, dynamic> json) {
    idCawangan = json['id_cawangan'];
    namaCawangan = json['nama_cawangan'];
    latitud = json['latitud'];
    longitud = json['longitud'];
    alamat1 = json['alamat1'];
    alamat2 = json['alamat2'];
    alamat3 = json['alamat3'];
    alamat4 = json['alamat4'];
    daerah = json['daerah'];
    noTelefon = json['no_telefon'];
    noFaks = json['no_faks'];
    negeri = json['negeri'];
    kodQR = json['kodQR'];
    radius = json['radius'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_cawangan'] = idCawangan;
    data['nama_cawangan'] = namaCawangan;
    data['latitud'] = latitud;
    data['longitud'] = longitud;
    data['alamat1'] = alamat1;
    data['alamat2'] = alamat2;
    data['alamat3'] = alamat3;
    data['alamat4'] = alamat4;
    data['daerah'] = daerah;
    data['no_telefon'] = noTelefon;
    data['no_faks'] = noFaks;
    data['negeri'] = negeri;
    data['kodQR'] = kodQR;
    data['radius'] = radius;
    data['distance'] = distance;
    return data;
  }
}
