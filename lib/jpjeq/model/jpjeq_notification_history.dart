class NotificationHistoryModel {
  String? notification;
  int? timestamp;
  String? id;

  NotificationHistoryModel({
    this.notification,
    this.timestamp,
    this.id,
  });

  NotificationHistoryModel.fromJson(Map<String, dynamic> json) {
    notification = json['notification'];
    timestamp = json['timestamp'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification'] = notification;
    data['timestamp'] = timestamp;
    data['id'] = id;
    return data;
  }
}
