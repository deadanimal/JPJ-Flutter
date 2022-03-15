class RoadTaxStatusRequest {
  String? nokp;
  String? kategori;
  String? nokenderaan;
  String? versi;

  RoadTaxStatusRequest({
    this.nokp,
    this.kategori,
    this.nokenderaan,
    this.versi = "2.0",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['kategori'] = kategori;
    data['nokenderaan'] = nokenderaan;
    data['versi'] = versi;
    return data;
  }
}
