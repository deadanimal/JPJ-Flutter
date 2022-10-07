class JpjDirectoryResponse {
  String? namaNegeri;
  List<Cawangan>? cawangan;

  JpjDirectoryResponse({
    this.namaNegeri,
    this.cawangan,
  });

  JpjDirectoryResponse.fromJson(Map<String, dynamic> json) {
    namaNegeri = json['nama_negeri'];
    if (json['cawangan'] != null) {
      cawangan = <Cawangan>[];
      json['cawangan'].forEach((v) {
        cawangan!.add(Cawangan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_negeri'] = namaNegeri;
    if (cawangan != null) {
      data['cawangan'] = cawangan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cawangan {
  String? namaCawangan;
  String? alamatCawangan;
  String? notelefonCawangan;
  String? nofaksCawangan;
  String? waktuperkhidmatanCawangan;
  String? koordinatCawangan;

  Cawangan({
    this.namaCawangan,
    this.alamatCawangan,
    this.notelefonCawangan,
    this.nofaksCawangan,
    this.waktuperkhidmatanCawangan,
    this.koordinatCawangan,
  });

  Cawangan.fromJson(Map<String, dynamic> json) {
    namaCawangan = json['nama_cawangan'];
    alamatCawangan = json['alamat_cawangan'];
    notelefonCawangan = json['notelefon_cawangan'];
    nofaksCawangan = json['nofaks_cawangan'];
    waktuperkhidmatanCawangan = json['waktuperkhidmatan_cawangan'];
    koordinatCawangan = json['koordinat_cawangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_cawangan'] = namaCawangan;
    data['alamat_cawangan'] = alamatCawangan;
    data['notelefon_cawangan'] = notelefonCawangan;
    data['nofaks_cawangan'] = nofaksCawangan;
    data['waktuperkhidmatan_cawangan'] = waktuperkhidmatanCawangan;
    data['koordinat_cawangan'] = koordinatCawangan;
    return data;
  }
}
