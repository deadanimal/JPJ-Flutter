class JpjLocationInfo {
  String? id;
  String? flagPath;
  String? name;

  JpjLocationInfo({this.id, this.flagPath, this.name});

  JpjLocationInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    flagPath = json['flagPath'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['flagPath'] = flagPath;
    data['name'] = name;
    return data;
  }
}
