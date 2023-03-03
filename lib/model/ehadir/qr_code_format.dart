class QrCodeFormat {
  int? kod;
  String? message;
  String? nama;
  String? bahagian;
  String? namabahagian;
  String? nokp;

  QrCodeFormat(
      {this.kod,
      this.message,
      this.nama,
      this.bahagian,
      this.namabahagian,
      this.nokp});

  QrCodeFormat.fromJson(Map<String, dynamic> json) {
    kod = json['kod'];
    message = json['message'];
    nama = json['nama'];
    bahagian = json['bahagian'];
    namabahagian = json['namabahagian'];
    nokp = json['nokp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kod'] = kod;
    data['message'] = message;
    data['nama'] = nama;
    data['bahagian'] = bahagian;
    data['namabahagian'] = namabahagian;
    data['nokp'] = nokp;
    return data;
  }
}
