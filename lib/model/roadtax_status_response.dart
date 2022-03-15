class RoadTaxStatusResponse {
  String? nama;
  String? nokp;
  String? kategori;
  String? nokenderaan;
  List<Lkm>? lkm;

  RoadTaxStatusResponse({
    this.nama,
    this.nokp,
    this.kategori,
    this.nokenderaan,
    this.lkm,
  });

  RoadTaxStatusResponse.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    nokp = json['nokp'];
    kategori = json['kategori'];
    nokenderaan = json['nokenderaan'];
    if (json['lkm'] != null) {
      lkm = <Lkm>[];
      json['lkm'].forEach((v) {
        lkm!.add(Lkm.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['nokp'] = nokp;
    data['kategori'] = kategori;
    data['nokenderaan'] = nokenderaan;
    if (lkm != null) {
      data['lkm'] = lkm!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lkm {
  int? bil;
  String? jenis;
  String? velinsuran;
  String? tarikhcomment;
  String? expiredate;

  Lkm({
    this.bil,
    this.jenis,
    this.velinsuran,
    this.tarikhcomment,
    this.expiredate,
  });

  Lkm.fromJson(Map<String, dynamic> json) {
    bil = json['bil'];
    jenis = json['jenis'];
    velinsuran = json['velinsuran'];
    tarikhcomment = json['tarikhcomment'];
    expiredate = json['expiredate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bil'] = bil;
    data['jenis'] = jenis;
    data['velinsuran'] = velinsuran;
    data['tarikhcomment'] = tarikhcomment;
    data['expiredate'] = expiredate;
    return data;
  }
}
