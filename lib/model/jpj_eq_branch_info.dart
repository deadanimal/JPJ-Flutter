class JpjEqBranchInfo {
  late String branch;
  String? address;
  String? phoneNumber;
  String? faxNumber;
  String? coordinate;
  String? waitingListCount;
  List<AvailableService>? services;

  JpjEqBranchInfo({
    required this.branch,
    this.address,
    this.phoneNumber,
    this.faxNumber,
    this.coordinate,
    this.waitingListCount,
    this.services,
  });

  JpjEqBranchInfo.fromJson(Map<String, dynamic> json) {
    branch = json['branch'];
    address = json['address'];
    faxNumber = json['faxNumber'];
    phoneNumber = json['phoneNumber'];
    coordinate = json['coordinate'];
    waitingListCount = json['waitingListCount'];
    if (json['services'] != null) {
      services = <AvailableService>[];
      json['services'].forEach((v) {
        services!.add(AvailableService.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['branch'] = branch;
    data['address'] = address;
    data['phoneNumber'] = phoneNumber;
    data['faxNumber'] = faxNumber;
    data['coordinate'] = coordinate;
    data['waitingListCount'] = waitingListCount;
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvailableService {
  late String? category;
  late List<String>? services;

  AvailableService({
    this.category,
    this.services,
  });

  AvailableService.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    services = json['services'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['services'] = services;
    return data;
  }
}
