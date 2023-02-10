class ActivityListRes {
  List<Aktiviti>? aktiviti;

  ActivityListRes({this.aktiviti});

  ActivityListRes.fromJson(Map<String, dynamic> json) {
    if (json['aktiviti'] != null) {
      aktiviti = <Aktiviti>[];
      json['aktiviti'].forEach((v) {
        aktiviti!.add(Aktiviti.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (aktiviti != null) {
      data['aktiviti'] = aktiviti!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Aktiviti {
  int? id;
  String? transidAktiviti;
  String? namaAktiviti;
  String? tarikhMula;
  String? tarikhTamat;
  List<MasaSesi>? masaSesi;
  String? lokasi;
  String? urusetia;
  User? user;

  Aktiviti({
    this.id,
    this.transidAktiviti,
    this.namaAktiviti,
    this.tarikhMula,
    this.tarikhTamat,
    this.masaSesi,
    this.lokasi,
    this.urusetia,
    this.user,
  });

  Aktiviti.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transidAktiviti = json['transid_aktiviti'];
    namaAktiviti = json['nama_aktiviti'];
    tarikhMula = json['tarikh_mula'];
    tarikhTamat = json['tarikh_tamat'];
    if (json['masa_sesi'] != null) {
      masaSesi = <MasaSesi>[];
      json['masa_sesi'].forEach((v) {
        masaSesi!.add(MasaSesi.fromJson(v));
      });
    }
    lokasi = json['lokasi'];
    urusetia = json['urusetia'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transid_aktiviti'] = transidAktiviti;
    data['nama_aktiviti'] = namaAktiviti;
    data['tarikh_mula'] = tarikhMula;
    data['tarikh_tamat'] = tarikhTamat;
    if (masaSesi != null) {
      data['masa_sesi'] = masaSesi!.map((v) => v.toJson()).toList();
    }
    data['lokasi'] = lokasi;
    data['urusetia'] = urusetia;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class MasaSesi {
  int? sesi;
  String? masaMula;
  String? masaTamat;

  MasaSesi({this.sesi, this.masaMula, this.masaTamat});

  MasaSesi.fromJson(Map<String, dynamic> json) {
    sesi = json['sesi'];
    masaMula = json['masa_mula'];
    masaTamat = json['masa_tamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sesi'] = sesi;
    data['masa_mula'] = masaMula;
    data['masa_tamat'] = masaTamat;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? nama;
  String? nokp;
  String? alamat;
  String? negeri;
  String? email;
  String? emailVerifiedAt;
  String? telefon;
  int? statusLogin;
  String? role;
  String? hqStatus;
  String? branchId;
  String? playerId;
  String? createdAt;
  String? updatedAt;
  String? namabahagian;
  String? refNo;

  User(
      {this.id,
      this.username,
      this.nama,
      this.nokp,
      this.alamat,
      this.negeri,
      this.email,
      this.emailVerifiedAt,
      this.telefon,
      this.statusLogin,
      this.role,
      this.hqStatus,
      this.branchId,
      this.playerId,
      this.createdAt,
      this.updatedAt,
      this.namabahagian,
      this.refNo});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    nama = json['nama'];
    nokp = json['nokp'];
    alamat = json['alamat'];
    negeri = json['negeri'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    telefon = json['telefon'];
    statusLogin = json['status_login'];
    role = json['role'];
    hqStatus = json['hq_status'];
    branchId = json['branch_id'];
    playerId = json['player_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    namabahagian = json['namabahagian'];
    refNo = json['ref_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['nama'] = nama;
    data['nokp'] = nokp;
    data['alamat'] = alamat;
    data['negeri'] = negeri;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['telefon'] = telefon;
    data['status_login'] = statusLogin;
    data['role'] = role;
    data['hq_status'] = hqStatus;
    data['branch_id'] = branchId;
    data['player_id'] = playerId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['namabahagian'] = namabahagian;
    data['ref_no'] = refNo;
    return data;
  }
}
