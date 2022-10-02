class AduanUploadResponse {
  dynamic upload;
  String? type;
  String? size;
  String? file;

  AduanUploadResponse({this.upload, this.type, this.size, this.file});

  AduanUploadResponse.fromJson(Map<String, dynamic> json) {
    upload = json['upload'];
    type = json['type'];
    size = json['size'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['upload'] = upload;
    data['type'] = type;
    data['size'] = size;
    data['file'] = file;
    return data;
  }
}
