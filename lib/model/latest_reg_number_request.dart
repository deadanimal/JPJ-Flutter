class LatestRegNumberRequest {
  late String stateCode;
  String version;

  LatestRegNumberRequest({
    required this.stateCode,
    this.version = "2.0",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kod'] = stateCode;
    data['versi'] = version;
    return data;
  }
}
