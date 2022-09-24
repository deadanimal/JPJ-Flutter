class SummonsStatusRequest {
  String? nokp;
  String? kategori;
  String? nokenderaan;

  SummonsStatusRequest({
    this.nokp,
    this.kategori,
    this.nokenderaan,
  });

  SummonsStatusRequest.fromJson(Map<String, dynamic> json) {
    nokp = json['nokp'];
    kategori = json['kategori'];
    nokenderaan = json['nokenderaan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['kategori'] = kategori;
    data['nokenderaan'] = nokenderaan;
    return data;
  }
}
