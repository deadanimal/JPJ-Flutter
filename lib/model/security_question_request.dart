class SecurityQuestionRequest {
  String? nokp;
  String? soalan1;
  String? soalan2;
  String? soalan3;
  String? jawapan1;
  String? jawapan2;
  String? jawapan3;

  SecurityQuestionRequest({
    this.nokp,
    this.soalan1,
    this.soalan2,
    this.soalan3,
    this.jawapan1,
    this.jawapan2,
    this.jawapan3,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nokp'] = nokp;
    data['soalan1'] = soalan1;
    data['soalan2'] = soalan2;
    data['soalan3'] = soalan3;
    data['jawapan1'] = jawapan1;
    data['jawapan2'] = jawapan2;
    data['jawapan3'] = jawapan3;
    return data;
  }
}
