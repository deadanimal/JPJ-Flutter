class TestResultResponse {
  String? nama;
  String? nokp;
  String? kategori;
  List<LesenP>? lesenP;

  TestResultResponse({
    this.nama,
    this.nokp,
    this.kategori,
    this.lesenP,
  });

  TestResultResponse.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    nokp = json['nokp'];
    kategori = json['kategori'];
    if (json['lesenP'] != null) {
      lesenP = <LesenP>[];
      json['lesenP'].forEach(
        (v) {
          lesenP!.add(
            LesenP.fromJson(v),
          );
        },
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['nokp'] = nokp;
    data['kategori'] = kategori;
    if (lesenP != null) {
      data['lesenP'] = lesenP!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LesenP {
  int? bil;
  String? tarikhujian;
  String? jenisUjian;
  String? lokasiUjian;
  String? jenisLesen;
  String? kelaslesen;
  String? keputusan;

  LesenP({
    this.bil,
    this.tarikhujian,
    this.jenisUjian,
    this.lokasiUjian,
    this.jenisLesen,
    this.kelaslesen,
    this.keputusan,
  });

  LesenP.fromJson(Map<String, dynamic> json) {
    bil = json['bil'];
    tarikhujian = json['tarikhujian'];
    jenisUjian = json['jenisUjian'];
    lokasiUjian = json['lokasiUjian'];
    jenisLesen = json['jenisLesen'];
    kelaslesen = json['kelaslesen'];
    keputusan = json['Keputusan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bil'] = bil;
    data['tarikhujian'] = tarikhujian;
    data['jenisUjian'] = jenisUjian;
    data['lokasiUjian'] = lokasiUjian;
    data['jenisLesen'] = jenisLesen;
    data['kelaslesen'] = kelaslesen;
    data['Keputusan'] = keputusan;
    return data;
  }
}
