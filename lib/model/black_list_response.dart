class BlackListStatusResponse {
  String? nama;
  String? nokp;
  String? kategori;
  Null? blacklist;

  BlackListStatusResponse({
    this.nama,
    this.nokp,
    this.kategori,
    this.blacklist,
  });

  BlackListStatusResponse.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    nokp = json['nokp'];
    kategori = json['kategori'];
    blacklist = json['blacklist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['nokp'] = nokp;
    data['kategori'] = kategori;
    data['blacklist'] = blacklist;
    return data;
  }
}
