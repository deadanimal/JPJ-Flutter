class SecurityQuestion {
  String? id;
  bool? staffQuestion;
  String? en;
  String? ms;

  SecurityQuestion({
    this.id,
    this.staffQuestion,
    this.en,
    this.ms,
  });

  SecurityQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    staffQuestion = json['staff_question'];
    en = json['en'];
    ms = json['ms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['staff_question'] = staffQuestion;
    data['en'] = en;
    data['ms'] = ms;
    return data;
  }
}
