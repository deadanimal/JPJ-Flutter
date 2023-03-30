class AddComitteeRes {
  int? kod;
  String? message;
  String? nama;
  String? nokp;
  String? bahagian;

  AddComitteeRes({
    this.kod,
    this.message,
    this.nama,
    this.nokp,
    this.bahagian,
  });

  AddComitteeRes.fromJson(Map<String, dynamic> json) {
    kod = json['kod'];
    message = json['message'];
    nama = json['nama'];
    nokp = json['nokp'];
    bahagian = json['bahagian'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kod'] = kod;
    data['message'] = message;
    data['nama'] = nama;
    data['nokp'] = nokp;
    data['bahagian'] = bahagian;
    return data;
  }
}
