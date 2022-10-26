class NewUserRegistrationResponse {
  String? userId;
  String? statusCode;
  String? tempPwd;
  String? status;
  String? msg;
  String? statusMsg;

  NewUserRegistrationResponse({
    this.userId,
    this.tempPwd,
    this.status,
    this.msg,
    this.statusMsg,
    this.statusCode,
  });

  NewUserRegistrationResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    tempPwd = json['tempPwd'];
    status = json['status'];
    msg = json['msg'];
    statusCode = json['status_code'];
    statusMsg = json['status_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['tempPwd'] = tempPwd;
    data['status'] = status;
    data['msg'] = msg;
    data['status_code'] = statusCode;
    data['status_msg'] = statusMsg;
    return data;
  }
}
