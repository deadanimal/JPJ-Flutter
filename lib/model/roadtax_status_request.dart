class RoadTaxStatusRequest {
  String? nokp;
  String? kategori;
  String? nokenderaan;

  RoadTaxStatusRequest({
    this.nokp,
    this.kategori,
    this.nokenderaan,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['kategori'] = kategori;
    data['nokenderaan'] = nokenderaan;
    return data;
  }
}
