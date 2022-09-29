class ResetPasswordResponse {
  String? nama;
  String? kategori;
  String? tac;
  String? status;
  String? msg;

  ResetPasswordResponse({
    this.nama,
    this.kategori,
    this.tac,
    this.status,
    this.msg,
  });

  ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    kategori = json['kategori'];
    tac = json['tac'];
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['kategori'] = kategori;
    data['tac'] = tac;
    data['status'] = status;
    data['msg'] = msg;
    return data;
  }
}
