class DemeritStatusResponse {
  int? status;
  String? name;
  String? idNo;
  String? category;
  String? kejaraPoint;

  DemeritStatusResponse({
    this.status,
    this.name,
    this.idNo,
    this.category,
    this.kejaraPoint,
  });

  DemeritStatusResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    idNo = json['idNo'];
    category = json['category'];
    kejaraPoint = json['kejaraPoint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['name'] = name;
    data['idNo'] = idNo;
    data['category'] = category;
    data['kejaraPoint'] = kejaraPoint;
    return data;
  }
}
