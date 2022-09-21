class ChangePasswordResponse {
  String? status;
  String? msg;

  ChangePasswordResponse({
    this.status,
    this.msg,
  });

  ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    return data;
  }
}
