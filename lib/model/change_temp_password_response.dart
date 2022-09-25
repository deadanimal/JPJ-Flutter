class ChangeTempPasswordResponse {
  String? status;
  String? msg;

  ChangeTempPasswordResponse({this.status, this.msg});

  ChangeTempPasswordResponse.fromJson(Map<String, dynamic> json) {
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
