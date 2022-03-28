class LoginResponse {
  String? status;
  String? msg;
  List<UserInfo>? userInfo;

  LoginResponse({this.status, this.msg, this.userInfo});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['userInfo'] != null) {
      userInfo = <UserInfo>[];
      json['userInfo'].forEach((v) {
        userInfo!.add(UserInfo.fromJson(v));
      });
    }
  }
}

class UserInfo {
  String? id;
  String? username;
  String? name;
  String? idNumber;
  String? category;
  String? dob;
  String? address1;
  String? address2;
  String? address3;
  String? postcode;
  String? city;
  String? state;
  String? stateName;
  String? email;
  String? phone;
  String? activeStatus;
  String? onesignalId;
  String? lastLogin;
  String? createDate;
  String? updateDate;

  UserInfo(
      {this.id,
      this.username,
      this.name,
      this.idNumber,
      this.category,
      this.dob,
      this.address1,
      this.address2,
      this.address3,
      this.postcode,
      this.city,
      this.state,
      this.stateName,
      this.email,
      this.phone,
      this.activeStatus,
      this.onesignalId,
      this.lastLogin,
      this.createDate,
      this.updateDate});

  UserInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['nama'];
    idNumber = json['nokp'];
    category = json['kategori'];
    dob = json['dob'];
    address1 = json['alamat1'];
    address2 = json['alamat2'];
    address3 = json['alamat3'];
    postcode = json['poskod'];
    city = json['bandar'];
    state = json['negeri'];
    stateName = json['nama_negeri'];
    email = json['emel'];
    phone = json['telefon'];
    activeStatus = json['status_aktif'];
    onesignalId = json['onesignal_id'];
    lastLogin = json['last_login'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
  }
}
