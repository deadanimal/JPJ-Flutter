class BlackListStatusResponse {
  int? status;
  String? icno;
  String? vehicleRegno;
  String? message;

  BlackListStatusResponse({
    this.status,
    this.icno,
    this.vehicleRegno,
    this.message,
  });

  BlackListStatusResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    icno = json['icno'];
    vehicleRegno = json['vehicleRegno'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['icno'] = icno;
    data['vehicleRegno'] = vehicleRegno;
    data['message'] = message;
    return data;
  }
}
