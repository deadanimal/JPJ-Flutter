class SummonsStatusResponse {
  String? name;
  String? id;
  String? category;
  List<Summons>? summons;

  SummonsStatusResponse({
    this.name,
    this.id,
    this.category,
    this.summons,
  });

  SummonsStatusResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    category = json['category'];
    if (json['summons'] != null) {
      summons = <Summons>[];
      json['summons'].forEach((v) {
        summons!.add(Summons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['category'] = category;
    if (summons != null) {
      data['summons'] = summons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summons {
  int? bil;
  String? vehicleRegistration;
  String? summonsId;
  String? offense;
  String? location;
  String? amount;
  String? date;
  String? paymentStatus;

  Summons({
    this.bil,
    this.summonsId,
    this.offense,
    this.location,
    this.amount,
    this.paymentStatus,
    this.vehicleRegistration,
    this.date,
  });

  Summons.fromJson(Map<String, dynamic> json) {
    bil = json['bil'];
    offense = json['offense'];
    summonsId = json['summonsId'];
    location = json['location'];
    amount = json['amount'];
    paymentStatus = json['paymentStatus'];
    vehicleRegistration = json['vehicleRegistration'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bil'] = bil;
    data['offense'] = offense;
    data['summonsId'] = summonsId;
    data['location'] = location;
    data['amount'] = amount;
    data['paymentStatus'] = paymentStatus;
    data['vehicleRegistration'] = vehicleRegistration;
    data['date'] = date;
    return data;
  }
}
