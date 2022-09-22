class LicenseStatusRequest {
  String? nokp;
  String? kategori;

  LicenseStatusRequest({
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
