class DemeritStatusResponse {
  int? status;
  String? name;
  String? idNo;
  String? category;
  String? kejaraPoint;
  int? statusCode;
  String? statusMessage;

  DemeritStatusResponse({
    this.status,
    this.name,
    this.idNo,
    this.category,
    this.kejaraPoint,
    this.statusCode,
    this.statusMessage,
  });

  DemeritStatusResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    idNo = json['idNo'];
    category = json['category'];
    kejaraPoint = json['kejaraPoint'];
    statusCode = json['statusCode'];
    statusMessage = json['statusMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['name'] = name;
    data['idNo'] = idNo;
    data['category'] = category;
    data['kejaraPoint'] = kejaraPoint;
    data['statusCode'] = statusCode;
    data['statusMessage'] = statusMessage;
    return data;
  }
}
