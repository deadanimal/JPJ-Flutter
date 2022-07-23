class DemeritStatusRequest {
  String? nokp;
  String? kategori;

  DemeritStatusRequest({this.nokp, this.kategori});

  DemeritStatusRequest.fromJson(Map<String, dynamic> json) {
    nokp = json['nokp'];
    kategori = json['kategori'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['kategori'] = kategori;
    return data;
  }
}
