class ResetPasswordRequest {
  String? nokp;
  String? emel;

  ResetPasswordRequest({
    this.nokp,
    this.emel,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['emel'] = emel;
    return data;
  }
}
