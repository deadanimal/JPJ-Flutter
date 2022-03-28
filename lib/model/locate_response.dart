class LocateResponse {
  List<Data>? data;

  LocateResponse({this.data});

  LocateResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? id;
  String? stateId;
  String? name;
  String? address;
  String? phoneNo;
  String? faxNo;
  String? coordinate;
  String? coordinate2;

  Data(
      {this.id,
      this.stateId,
      this.name,
      this.address,
      this.phoneNo,
      this.faxNo,
      this.coordinate,
      this.coordinate2});

  Data.fromJson(Map<String, dynamic> json) {
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
