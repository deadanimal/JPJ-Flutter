class SummonsStatusRequest {
  String? nokp;
  String? kategori;

  SummonsStatusRequest({this.nokp, this.kategori});

  SummonsStatusRequest.fromJson(Map<String, dynamic> json) {
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
