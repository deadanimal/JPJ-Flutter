class RoadTaxStatusResponse {
  List<Status>? status;
  String? user;
  String? nokp;
  String? kategori;
  int? bil;
  List<VehicleInfo>? vehicleInfo;

  RoadTaxStatusResponse({
    this.status,
    this.user,
    this.nokp,
    this.kategori,
    this.bil,
    this.vehicleInfo,
  });

  RoadTaxStatusResponse.fromJson(Map<String, dynamic> json) {
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(Status.fromJson(v));
      });
    }
    user = json['user'];
    nokp = json['nokp'];
    kategori = json['kategori'];
    bil = json['bil'];
    if (json['vehicle_info'] != null) {
      vehicleInfo = <VehicleInfo>[];
      json['vehicle_info'].forEach((v) {
        vehicleInfo!.add(VehicleInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status?.map((v) => v.toJson()).toList();
    }
    data['user'] = user;
    data['nokp'] = nokp;
    data['kategori'] = kategori;
    data['bil'] = bil;
    if (vehicleInfo != null) {
      data['vehicle_info'] = vehicleInfo?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  String? statusCode;
  String? statusMessage;

  Status({
    this.statusCode,
    this.statusMessage,
  });

  Status.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['status_message'] = statusMessage;
    return data;
  }
}

class VehicleInfo {
  String? vehicleInsurance;
  String? dateOfCommencement;
  String? expired;

  VehicleInfo({
    this.vehicleInsurance,
    this.dateOfCommencement,
    this.expired,
  });

  VehicleInfo.fromJson(Map<String, dynamic> json) {
    vehicleInsurance = json['vehicle_insurance'];
    dateOfCommencement = json['date_of_commencement'];
    expired = json['expired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vehicle_insurance'] = vehicleInsurance;
    data['date_of_commencement'] = dateOfCommencement;
    data['expired'] = expired;
    return data;
  }
}
