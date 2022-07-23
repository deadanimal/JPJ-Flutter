class DemeritStatusResponse {
  String? nama;
  String? noic;
  Null? kejarapoint;

  DemeritStatusResponse({this.nama, this.noic, this.kejarapoint});

  DemeritStatusResponse.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    noic = json['noic'];
    kejarapoint = json['kejarapoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['noic'] = noic;
    data['kejarapoint'] = kejarapoint;
    return data;
  }
}
