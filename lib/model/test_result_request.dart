class TestResultRequest {
  String? nokp;
  int? kategori;
  String versi;

  TestResultRequest({
    this.nokp,
    this.kategori,
    this.versi = "2.0",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['kategori'] = kategori;
    data['versi'] = versi;
    return data;
  }
}
