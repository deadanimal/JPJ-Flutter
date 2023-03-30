class AttendeeResponse {
  int? id;
  String? transidAktiviti;
  String? transidSesi;
  String? tarikh;
  String? masa;
  String? nokp;
  String? kodbahagian;
  String? latitude;
  String? longitude;
  String? agensi;
  int? aktivitiId;
  int? userId;
  String? stafId;
  String? stafBahagianId;
  String? createdAt;
  String? updatedAt;
  User? user;

  AttendeeResponse({
    this.id,
    this.transidAktiviti,
    this.transidSesi,
    this.tarikh,
    this.masa,
    this.nokp,
    this.kodbahagian,
    this.latitude,
    this.longitude,
    this.agensi,
    this.aktivitiId,
    this.userId,
    this.stafId,
    this.stafBahagianId,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  AttendeeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transidAktiviti = json['transid_aktiviti'];
    transidSesi = json['transid_sesi'];
    tarikh = json['tarikh'];
    masa = json['masa'];
    nokp = json['nokp'];
    kodbahagian = json['kodbahagian'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    agensi = json['agensi'];
    aktivitiId = json['aktiviti_id'];
    userId = json['user_id'];
    stafId = json['staf_id'];
    stafBahagianId = json['staf_bahagian_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transid_aktiviti'] = transidAktiviti;
    data['transid_sesi'] = transidSesi;
    data['tarikh'] = tarikh;
    data['masa'] = masa;
    data['nokp'] = nokp;
    data['kodbahagian'] = kodbahagian;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['agensi'] = agensi;
    data['aktiviti_id'] = aktivitiId;
    data['user_id'] = userId;
    data['staf_id'] = stafId;
    data['staf_bahagian_id'] = stafBahagianId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
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
  String? statusLogin;
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
