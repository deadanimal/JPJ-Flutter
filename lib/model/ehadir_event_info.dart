class EHadirEventInfo {
  String? id;
  String? key;
  String? eventName;
  String? organizer;
  String? venue;
  String? date;
  String? startTime;
  String? endTime;

  EHadirEventInfo({
    this.id,
    this.key,
    this.eventName,
    this.organizer,
    this.venue,
    this.date,
    this.startTime,
    this.endTime,
  });

  EHadirEventInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    eventName = json['eventName'];
    organizer = json['organizer'];
    venue = json['venue'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key'] = key;
    data['eventName'] = eventName;
    data['organizer'] = organizer;
    data['venue'] = venue;
    data['date'] = date;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    return data;
  }
}
