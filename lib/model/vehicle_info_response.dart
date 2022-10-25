class VehicleInfoResponse {
  String? statusCode;
  List<MaklumatKenderaan>? maklumatKenderaan;

  VehicleInfoResponse({
    this.statusCode,
    this.maklumatKenderaan,
  });

  VehicleInfoResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['maklumat_kenderaan'] != null) {
      maklumatKenderaan = <MaklumatKenderaan>[];
      json['maklumat_kenderaan'].forEach((v) {
        maklumatKenderaan!.add(MaklumatKenderaan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    if (maklumatKenderaan != null) {
      data['maklumat_kenderaan'] =
          maklumatKenderaan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MaklumatKenderaan {
  int? id;
  String? nokp;
  String? noKenderaan;
  String? tarikhTamat;
  String? createdAt;
  String? updatedAt;

  MaklumatKenderaan({
    this.id,
    this.nokp,
    this.noKenderaan,
    this.tarikhTamat,
    this.createdAt,
    this.updatedAt,
  });

  MaklumatKenderaan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nokp = json['nokp'];
    noKenderaan = json['no_kenderaan'];
    tarikhTamat = json['tarikh_tamat'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nokp'] = nokp;
    data['no_kenderaan'] = noKenderaan;
    data['tarikh_tamat'] = tarikhTamat;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
