class JpjEqBranchServiceResponse {
  String? status;
  String? msg;
  List<Data2>? data2;
  String? quota;
  List<Waktu>? waktu;

  JpjEqBranchServiceResponse({
    this.status,
    this.msg,
    this.data2,
    this.quota,
    this.waktu,
  });

  JpjEqBranchServiceResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data2'] != null) {
      data2 = <Data2>[];
      json['data2'].forEach((v) {
        data2!.add(Data2.fromJson(v));
      });
    }
    quota = json['quota'];
    if (json['waktu'] != null) {
      waktu = <Waktu>[];
      json['waktu'].forEach((v) {
        waktu!.add(Waktu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    if (data2 != null) {
      data['data2'] = data2!.map((v) => v.toJson()).toList();
    }
    data['quota'] = quota;
    if (waktu != null) {
      data['waktu'] = waktu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data2 {
  String? id;
  String? keterangan;
  String? kategori;
  List<Info>? info;
  Null? kuota;

  Data2({this.id, this.keterangan, this.kategori, this.info, this.kuota});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    keterangan = json['keterangan'];
    kategori = json['kategori'];
    if (json['info'] != null) {
      info = <Info>[];
      json['info'].forEach((v) {
        info!.add(Info.fromJson(v));
      });
    }
    kuota = json['kuota'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['keterangan'] = keterangan;
    data['kategori'] = kategori;
    if (info != null) {
      data['info'] = info!.map((v) => v.toJson()).toList();
    }
    data['kuota'] = kuota;
    return data;
  }
}

class Info {
  String? keterangan;

  Info({this.keterangan});

  Info.fromJson(Map<String, dynamic> json) {
    keterangan = json['keterangan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['keterangan'] = keterangan;
    return data;
  }
}

class Waktu {
  String? id;
  String? cawangan;
  String? namaHari;
  String? waktuMula;
  String? waktuTamat;
  String? sesi;
  String? statusAktif;
  String? createDate;
  String? updateDate;

  Waktu({
    this.id,
    this.cawangan,
    this.namaHari,
    this.waktuMula,
    this.waktuTamat,
    this.sesi,
    this.statusAktif,
    this.createDate,
    this.updateDate,
  });

  Waktu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cawangan = json['cawangan'];
    namaHari = json['nama_hari'];
    waktuMula = json['waktu_mula'];
    waktuTamat = json['waktu_tamat'];
    sesi = json['sesi'];
    statusAktif = json['status_aktif'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cawangan'] = cawangan;
    data['nama_hari'] = namaHari;
    data['waktu_mula'] = waktuMula;
    data['waktu_tamat'] = waktuTamat;
    data['sesi'] = sesi;
    data['status_aktif'] = statusAktif;
    data['create_date'] = createDate;
    data['update_date'] = updateDate;
    return data;
  }
}
