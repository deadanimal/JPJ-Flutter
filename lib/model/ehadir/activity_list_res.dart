class ActivityListRes {
  List<Aktiviti>? aktiviti;

  ActivityListRes({this.aktiviti});

  ActivityListRes.fromJson(Map<String, dynamic> json) {
    if (json['aktiviti'] != null) {
      aktiviti = <Aktiviti>[];
      json['aktiviti'].forEach((v) {
        aktiviti!.add(Aktiviti.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (aktiviti != null) {
      data['aktiviti'] = aktiviti!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Aktiviti {
  int? id;
  String? transidAktiviti;
  String? namaAktiviti;
  String? tarikhMula;
  String? tarikhTamat;
  List<MasaSesi>? masaSesi;
  String? lokasi;
  String? urusetia;

  Aktiviti(
      {this.id,
      this.transidAktiviti,
      this.namaAktiviti,
      this.tarikhMula,
      this.tarikhTamat,
      this.masaSesi,
      this.lokasi,
      this.urusetia});

  Aktiviti.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transidAktiviti = json['transid_aktiviti'];
    namaAktiviti = json['nama_aktiviti'];
    tarikhMula = json['tarikh_mula'];
    tarikhTamat = json['tarikh_tamat'];
    if (json['masa_sesi'] != null) {
      masaSesi = <MasaSesi>[];
      json['masa_sesi'].forEach((v) {
        masaSesi!.add(MasaSesi.fromJson(v));
      });
    }
    lokasi = json['lokasi'];
    urusetia = json['urusetia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transid_aktiviti'] = transidAktiviti;
    data['nama_aktiviti'] = namaAktiviti;
    data['tarikh_mula'] = tarikhMula;
    data['tarikh_tamat'] = tarikhTamat;
    if (masaSesi != null) {
      data['masa_sesi'] = masaSesi!.map((v) => v.toJson()).toList();
    }
    data['lokasi'] = lokasi;
    data['urusetia'] = urusetia;
    return data;
  }
}

class MasaSesi {
  int? sesi;
  String? masaMula;
  String? masaTamat;

  MasaSesi({this.sesi, this.masaMula, this.masaTamat});

  MasaSesi.fromJson(Map<String, dynamic> json) {
    sesi = json['sesi'];
    masaMula = json['masa_mula'];
    masaTamat = json['masa_tamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sesi'] = sesi;
    data['masa_mula'] = masaMula;
    data['masa_tamat'] = masaTamat;
    return data;
  }
}
