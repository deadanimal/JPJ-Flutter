class LatestRegNumberResponse {
  String? stateName;
  String? velno;
  int? bil;

  LatestRegNumberResponse({
    this.stateName,
    this.velno,
    this.bil,
  });

  LatestRegNumberResponse.fromJson(Map<String, dynamic> json) {
    stateName = json['stateName'];
    velno = json['velno'];
    bil = json['bil'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stateName'] = stateName;
    data['velno'] = velno;
    data['bil'] = bil;
    return data;
  }
}
