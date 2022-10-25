class VehicleInfoSaveReq {
  String? nokp;
  String? nokenderaan;

  VehicleInfoSaveReq({
    this.nokp,
    this.nokenderaan,
  });

  VehicleInfoSaveReq.fromJson(Map<String, dynamic> json) {
    nokp = json['nokp'];
    nokenderaan = json['nokenderaan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['nokenderaan'] = nokenderaan;
    return data;
  }
}
