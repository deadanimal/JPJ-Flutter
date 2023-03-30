class JpjEqServiceGroupResponse {
  String? status;
  String? msg;
  List<WaktuOperasi>? waktuOperasi;
  String? waktuMula;
  String? waktuTamat;
  List<Data2>? data2;

  JpjEqServiceGroupResponse({
    this.status,
    this.msg,
    this.waktuOperasi,
    this.waktuMula,
    this.waktuTamat,
    this.data2,
  });

  JpjEqServiceGroupResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['waktu_operasi'] != null) {
      waktuOperasi = <WaktuOperasi>[];
      json['waktu_operasi'].forEach((v) {
        waktuOperasi!.add(WaktuOperasi.fromJson(v));
      });
    }
    if (json['data2'] != null) {
      data2 = <Data2>[];
      json['data2'].forEach((v) {
        data2!.add(Data2.fromJson(v));
      });
    }
    waktuMula = json['waktu_mula'];
    waktuTamat = json['waktu_tamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (waktuOperasi != null) {
      data['waktu_operasi'] = waktuOperasi!.map((v) => v.toJson()).toList();
    }
    if (data2 != null) {
      data['data2'] = data2!.map((v) => v.toJson()).toList();
    }
    data['waktu_mula'] = waktuMula;
    data['waktu_tamat'] = waktuTamat;
    return data;
  }
}

class WaktuOperasi {
  String? namaHari;
  String? waktuMula;
  String? waktuTamat;

  WaktuOperasi({
    this.namaHari,
    this.waktuMula,
    this.waktuTamat,
  });

  WaktuOperasi.fromJson(Map<String, dynamic> json) {
    namaHari = json['nama_hari'];
    waktuMula = json['waktu_mula'];
    waktuTamat = json['waktu_tamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama_hari'] = namaHari;
    data['waktu_mula'] = waktuMula;
    data['waktu_tamat'] = waktuTamat;
    return data;
  }
}

class Data2 {
  String? id;
  String? keterangan;
  String? kategori;
  String? hadKategori;
  List<Info>? info;

  Data2({this.id, this.keterangan, this.kategori, this.hadKategori, this.info});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    keterangan = json['keterangan'];
    kategori = json['kategori'];
    hadKategori = json['had_kategori'];
    if (json['info'] != null) {
      info = <Info>[];
      json['info'].forEach((v) {
        info!.add(Info.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['keterangan'] = keterangan;
    data['kategori'] = kategori;
    data['had_kategori'] = hadKategori;
    if (info != null) {
      data['info'] = info!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  String? keterangan;

  Info({
    this.keterangan,
  });

  Info.fromJson(Map<String, dynamic> json) {
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['keterangan'] = keterangan;
    return data;
  }
}
