class LicenseStatusResponse {
  int? status;
  String? user;
  String? nokp;
  int? bil;
  List<Lesen>? lesen;

  LicenseStatusResponse({
    this.status,
    this.user,
    this.nokp,
    this.bil,
    this.lesen,
  });

  LicenseStatusResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'];
    nokp = json['nokp'];
    bil = json['bil'];
    if (json['lesen'] != null) {
      lesen = <Lesen>[];
      json['lesen'].forEach((v) {
        lesen?.add(Lesen.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['user'] = user;
    data['nokp'] = nokp;
    data['bil'] = bil;
    if (lesen != null) {
      data['lesen'] = lesen?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lesen {
  String? jenisLesen;
  String? tempohTamat;

  Lesen({
    this.jenisLesen,
    this.tempohTamat,
  });

  Lesen.fromJson(Map<String, dynamic> json) {
    jenisLesen = json['jenis_lesen'];
    tempohTamat = json['tempoh_tamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jenis_lesen'] = jenisLesen;
    data['tempoh_tamat'] = tempohTamat;
    return data;
  }
}
