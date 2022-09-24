class BlackListStatusRequest {
  String? nokp;
  String? nokenderaan;
  String? bltype;
  String? blcat;

  BlackListStatusRequest({
    this.nokp,
    this.nokenderaan,
    this.bltype = "veh",
    this.blcat = "jpj",
  });

  BlackListStatusRequest.fromJson(Map<String, dynamic> json) {
    nokp = json['nokp'];
    nokenderaan = json['nokenderaan'];
    bltype = json['bltype'];
    blcat = json['blcat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['nokenderaan'] = nokenderaan;
    data['bltype'] = bltype;
    data['blcat'] = blcat;
    return data;
  }
}
