class JpjBranchOperatingHour {
  late String day;
  late bool close;
  String? start;
  String? end;

  JpjBranchOperatingHour({
    required this.day,
    required this.close,
    this.start,
    this.end,
  });

  JpjBranchOperatingHour.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    close = json['close'];
    start = json['start'];
    end = json['end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['close'] = close;
    data['start'] = start;
    data['end'] = end;
    return data;
  }
}
