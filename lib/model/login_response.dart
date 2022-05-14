class LoginResponse {
  Result? result;

  LoginResponse({this.result});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Login>? login;

  Result({this.login});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['login'] != null) {
      login = <Login>[];
      json['login'].forEach((v) {
        login!.add(Login.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (login != null) {
      data['login'] = login!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Login {
  String? nama;
  String? emel;
  String? nokp;
  String? sec;
  String? passwd;
  String? statusLogin;

  Login(
      {this.nama,
      this.emel,
      this.nokp,
      this.sec,
      this.passwd,
      this.statusLogin});

  Login.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    emel = json['emel'];
    nokp = json['nokp'];
    sec = json['sec'];
    passwd = json['passwd'];
    statusLogin = json['status_login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['emel'] = emel;
    data['nokp'] = nokp;
    data['sec'] = sec;
    data['passwd'] = passwd;
    data['status_login'] = statusLogin;
    return data;
  }
}
