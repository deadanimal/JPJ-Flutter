class JPJEqHistory {
  String? date;
  String? branchName;
  String? registrationTime;
  String? queueNumber;
  String? counter;
  String? status;
  String? callTime;

  JPJEqHistory({
    this.date,
    this.branchName,
    this.registrationTime,
    this.queueNumber,
    this.counter,
    this.status,
    this.callTime,
  });

  factory JPJEqHistory.fromJson(Map<String, dynamic> json) => JPJEqHistory(
        date: json["date"],
        branchName: json["branch_name"],
        registrationTime: json["registration_time"],
        queueNumber: json["queue_number"],
        counter: json["counter"],
        status: json["status"],
        callTime: json["call_time"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "branch_name": branchName,
        "registration_time": registrationTime,
        "queue_number": queueNumber,
        "counter": counter,
        "status": status,
        "call_time": callTime,
      };
}
