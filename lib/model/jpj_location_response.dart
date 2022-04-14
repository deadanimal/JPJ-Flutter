class JpjLocationResponse {
  List<JpjLocationResponseData>? data;

  JpjLocationResponse({this.data});

  JpjLocationResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <JpjLocationResponseData>[];
      json['data'].forEach((v) {
        data!.add(JpjLocationResponseData.fromJson(v));
      });
    }
  }
}

class JpjLocationResponseData {
  String? id;
  String? stateId;
  String? name;
  String? address;
  String? phoneNo;
  String? faxNo;
  String? coordinate;
  String? coordinate2;
  String email = "";
  String operationalHour = "9:00 pagi - 4.00 tengahari";

  JpjLocationResponseData(
      {this.id,
      this.stateId,
      this.name,
      this.address,
      this.phoneNo,
      this.faxNo,
      this.coordinate,
      this.coordinate2});

  JpjLocationResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateId = json['idnegeri'];
    name = json['nama'];
    address = json['alamat'];
    phoneNo = json['nofon'];
    faxNo = json['nofaks'];
    coordinate = json['koordinat'];
    coordinate2 = json['koordinat2'];
  }
}
