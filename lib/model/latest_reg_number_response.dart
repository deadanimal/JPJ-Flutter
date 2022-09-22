class LatestRegNumberResponse {
  int? status;
  String? areaName;
  String? regnNo;

  LatestRegNumberResponse({
    this.status,
    this.areaName,
    this.regnNo,
  });

  LatestRegNumberResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    areaName = json['areaName'];
    regnNo = json['regnNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['areaName'] = areaName;
    data['regnNo'] = regnNo;
    return data;
  }
}
