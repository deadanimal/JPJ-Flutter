class LatestRegNumberRequest {
  late String areaCode;

  LatestRegNumberRequest({
    required this.areaCode,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['areaCode'] = areaCode;
    return data;
  }
}
