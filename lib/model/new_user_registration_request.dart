class NewUserRegistrationRequest {
  String? nokp;
  String? kategori;
  String? nama;
  String? emel;
  String? telefon;

  NewUserRegistrationRequest({
    this.nokp,
    this.kategori,
    this.nama,
    this.emel,
    this.telefon,
  });

  NewUserRegistrationRequest.fromJson(Map<String, dynamic> json) {
    nokp = json['nokp'];
    kategori = json['kategori'];
    nama = json['nama'];
    emel = json['emel'];
    telefon = json['telefon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['kategori'] = kategori;
    data['nama'] = nama;
    data['emel'] = emel;
    data['telefon'] = telefon;
    return data;
  }
}
