class SummonsStatusResponse {
  String? noic;
  List<Saman>? saman;

  SummonsStatusResponse({
    this.noic,
    this.saman,
  });

  SummonsStatusResponse.fromJson(Map<String, dynamic> json) {
    noic = json['noic'];
    if (json['saman'] != null) {
      saman = <Saman>[];
      json['saman'].forEach((v) {
        saman!.add(Saman.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['noic'] = noic;
    if (saman != null) {
      data['saman'] = saman!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Saman {
  String? notisId;
  String? respSta;
  String? respMsg;
  String? amountPaid;
  String? blacklistDate;
  String? categoryInd;
  String? compoundOfficer;
  String? courtCode;
  String? courtId;
  String? createBranch;
  String? createDate;
  String? createUser;
  String? effectiveDate;
  String? kejaraInd;
  String? lastPaymentDate;
  String? noticeDate;
  String? noticeType;
  String? offAmount;
  String? offCategory;
  String? offSection;
  String? offStatus;
  String? offType;
  String? offenceCtr;
  String? refNo;
  String? settleDate;
  String? status;
  String? sysInd;
  String? trialDate;
  String? trialTime;
  String? updateBranch;
  String? updateDate;
  String? updateUser;
  String? vehicleId;
  String? year;

  Saman({
    this.notisId,
    this.respSta,
    this.respMsg,
    this.amountPaid,
    this.blacklistDate,
    this.categoryInd,
    this.compoundOfficer,
    this.courtCode,
    this.courtId,
    this.createBranch,
    this.createDate,
    this.createUser,
    this.effectiveDate,
    this.kejaraInd,
    this.lastPaymentDate,
    this.noticeDate,
    this.noticeType,
    this.offAmount,
    this.offCategory,
    this.offSection,
    this.offStatus,
    this.offType,
    this.offenceCtr,
    this.refNo,
    this.settleDate,
    this.status,
    this.sysInd,
    this.trialDate,
    this.trialTime,
    this.updateBranch,
    this.updateDate,
    this.updateUser,
    this.vehicleId,
    this.year,
  });

  Saman.fromJson(Map<String, dynamic> json) {
    notisId = json['notisId'];
    respSta = json['respSta'];
    respMsg = json['respMsg'];
    amountPaid = json['amountPaid'];
    blacklistDate = json['blacklistDate'];
    categoryInd = json['categoryInd'];
    compoundOfficer = json['compoundOfficer'];
    courtCode = json['courtCode'];
    courtId = json['courtId'];
    createBranch = json['createBranch'];
    createDate = json['createDate'];
    createUser = json['createUser'];
    effectiveDate = json['effectiveDate'];
    kejaraInd = json['kejaraInd'];
    lastPaymentDate = json['lastPaymentDate'];
    noticeDate = json['noticeDate'];
    noticeType = json['noticeType'];
    offAmount = json['offAmount'];
    offCategory = json['offCategory'];
    offSection = json['offSection'];
    offStatus = json['offStatus'];
    offType = json['offType'];
    offenceCtr = json['offenceCtr'];
    refNo = json['refNo'];
    settleDate = json['settleDate'];
    status = json['status'];
    sysInd = json['sysInd'];
    trialDate = json['trialDate'];
    trialTime = json['trialTime'];
    updateBranch = json['updateBranch'];
    updateDate = json['updateDate'];
    updateUser = json['updateUser'];
    vehicleId = json['vehicleId'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notisId'] = notisId;
    data['respSta'] = respSta;
    data['respMsg'] = respMsg;
    data['amountPaid'] = amountPaid;
    data['blacklistDate'] = blacklistDate;
    data['categoryInd'] = categoryInd;
    data['compoundOfficer'] = compoundOfficer;
    data['courtCode'] = courtCode;
    data['courtId'] = courtId;
    data['createBranch'] = createBranch;
    data['createDate'] = createDate;
    data['createUser'] = createUser;
    data['effectiveDate'] = effectiveDate;
    data['kejaraInd'] = kejaraInd;
    data['lastPaymentDate'] = lastPaymentDate;
    data['noticeDate'] = noticeDate;
    data['noticeType'] = noticeType;
    data['offAmount'] = offAmount;
    data['offCategory'] = offCategory;
    data['offSection'] = offSection;
    data['offStatus'] = offStatus;
    data['offType'] = offType;
    data['offenceCtr'] = offenceCtr;
    data['refNo'] = refNo;
    data['settleDate'] = settleDate;
    data['status'] = status;
    data['sysInd'] = sysInd;
    data['trialDate'] = trialDate;
    data['trialTime'] = trialTime;
    data['updateBranch'] = updateBranch;
    data['updateDate'] = updateDate;
    data['updateUser'] = updateUser;
    data['vehicleId'] = vehicleId;
    data['year'] = year;
    return data;
  }
}
