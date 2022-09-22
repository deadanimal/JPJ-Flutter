class TestResultRequest {
  String? nokp;
  int? kategori;

  TestResultRequest({
    this.nokp,
    this.kategori,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['kategori'] = kategori;
    return data;
  }
}
