class CheckIdRequest {
  String? nokp;

  CheckIdRequest({this.nokp});

  CheckIdRequest.fromJson(Map<String, dynamic> json) {
    nokp = json['nokp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    return data;
  }
}
