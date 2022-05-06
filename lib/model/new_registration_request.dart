class RegistrationRequest {
  String? idNumber;
  String? email;
  String? phone;

  RegistrationRequest({
    this.idNumber,
    this.email,
    this.phone,
  });

  RegistrationRequest.fromJson(Map<String, dynamic> json) {
    idNumber = json['nokp'];
    email = json['emel'];
    phone = json['telefon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idNumber'] = idNumber;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
