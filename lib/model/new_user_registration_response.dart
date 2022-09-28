class NewUserRegistrationResponse {
  String? userId;
  String? tempPwd;
  String? status;
  String? msg;

  NewUserRegistrationResponse(
      {this.userId, this.tempPwd, this.status, this.msg});

  NewUserRegistrationResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    tempPwd = json['tempPwd'];
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['tempPwd'] = tempPwd;
    data['status'] = status;
    data['msg'] = msg;
    return data;
  }
}
