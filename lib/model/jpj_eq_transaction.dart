class JpjEqTransaction {
  late String branch;
  late String registrationTime;
  String? date;
  String? number;
  String? status;
  String? canceledTime;

  JpjEqTransaction({
    required this.branch,
    required this.registrationTime,
    this.date,
    this.number,
    this.status,
    this.canceledTime,
  });

  JpjEqTransaction.fromJson(Map<String, dynamic> json) {
    branch = json['branch'];
    registrationTime = json['registrationDate'];
    number = json['number'];
    date = json['date'];
    status = json['status'];
    canceledTime = json['canceledTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['branch'] = branch;
    data['registrationDate'] = registrationTime;
    data['date'] = date;
    data['number'] = number;
    data['status'] = status;
    data['canceledTime'] = canceledTime;
    return data;
  }
}
