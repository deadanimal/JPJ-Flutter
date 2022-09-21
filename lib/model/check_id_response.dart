class CheckIdResponse {
  String? status;
  String? message;
  String? nokp;
  String? name;
  String? email;
  String? phone;
  String? category;

  CheckIdResponse({
    this.status,
    this.message,
    this.nokp,
    this.name,
    this.email,
    this.phone,
    this.category,
  });

  CheckIdResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    nokp = json['nokp'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['nokp'] = nokp;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['category'] = category;
    return data;
  }
}
