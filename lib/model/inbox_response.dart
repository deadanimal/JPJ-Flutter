class InboxResponse {
  List<PetiMasuk>? petiMasuk;

  InboxResponse({
    this.petiMasuk,
  });

  InboxResponse.fromJson(Map<String, dynamic> json) {
    if (json['petiMasuk'] != null) {
      petiMasuk = <PetiMasuk>[];
      json['petiMasuk'].forEach((v) {
        petiMasuk!.add(PetiMasuk.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (petiMasuk != null) {
      data['petiMasuk'] = petiMasuk!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PetiMasuk {
  int? id;
  String? tajuk;
  String? perkara;
  int? jenisNoti;
  String? createDate;
  String? status;

  PetiMasuk({
    this.id,
    this.tajuk,
    this.perkara,
    this.jenisNoti,
    this.createDate,
    this.status,
  });

  PetiMasuk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tajuk = json['tajuk'];
    perkara = json['perkara'];
    jenisNoti = json['jenis_noti'];
    createDate = json['create_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tajuk'] = tajuk;
    data['perkara'] = perkara;
    data['jenis_noti'] = jenisNoti;
    data['create_date'] = createDate;
    data['status'] = status;
    return data;
  }
}
