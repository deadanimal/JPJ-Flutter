class TncResponse {
  int? id;
  String? title;
  String? description;
  String? createdAt;
  String? updatedAt;

  TncResponse({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  TncResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
