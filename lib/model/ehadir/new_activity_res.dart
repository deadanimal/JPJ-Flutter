class NewActivityRes {
  int? kod;
  String? message;

  NewActivityRes({this.kod, this.message});

  NewActivityRes.fromJson(Map<String, dynamic> json) {
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
