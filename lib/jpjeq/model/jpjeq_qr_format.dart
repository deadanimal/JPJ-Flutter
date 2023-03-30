// {"param":"e4676e3e4ae737ef807064f33dfec4dda65e0f85","id_cawangan":"0116111"}

class JpjEqQrFormat {
  String? param;
  String? idCawangan;

  JpjEqQrFormat({
    this.param,
    this.idCawangan,
  });

  JpjEqQrFormat.fromJson(Map<String, dynamic> json) {
    param = json['param'];
    idCawangan = json['id_cawangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['param'] = param;
    data['id_cawangan'] = idCawangan;
    return data;
  }
}
