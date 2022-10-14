class ShareResponse {
  String? textMs;
  String? textEn;
  String? link;

  ShareResponse({
    this.textMs,
    this.textEn,
    this.link,
  });

  ShareResponse.fromJson(Map<String, dynamic> json) {
    textMs = json['text_ms'];
    textEn = json['text_en'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text_ms'] = textMs;
    data['text_en'] = textEn;
    data['link'] = link;
    return data;
  }
}
