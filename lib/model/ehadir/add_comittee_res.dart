class AddComitteeRes {
  int? kod;
  String? message;

  AddComitteeRes({
    this.kod,
    this.message,
  });

  AddComitteeRes.fromJson(Map<String, dynamic> json) {
    kod = json['kod'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kod'] = kod;
    data['message'] = message;
    return data;
  }
}
