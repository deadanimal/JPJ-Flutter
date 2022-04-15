class InboxMessages {
  late String id;
  late String header;
  late String body;
  late bool read;
  late String date;
  late String time;

  InboxMessages({
    required this.id,
    required this.header,
    required this.body,
    required this.read,
    required this.date,
    required this.time,
  });

  InboxMessages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    body = json['body'];
    read = json['read'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['header'] = header;
    data['body'] = body;
    data['read'] = read;
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}
