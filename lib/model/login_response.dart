class LoginResponse {
  // success        0,
  // userNotFound   1,
  // wrongPassword  2,

  String? nama;
  String? emel;
  String? nokp;
  dynamic status;
  String? message;
  String? token;

  LoginResponse({
    this.nama,
    this.emel,
    this.nokp,
    this.status,
    this.message,
    this.token,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    emel = json['emel'];
    nokp = json['nokp'];
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['emel'] = emel;
    data['nokp'] = nokp;
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    return data;
  }
}
