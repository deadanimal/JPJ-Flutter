class LoginResponse {
  String? statusCode;
  String? statusMsg;
  String? idmpuUsrId;
  String? idmpuPassWord;
  String? idmpuManutiae;
  String? idmpuStatus;
  String? idmpuAclld;
  String? idmpuUserEmail;
  String? idmpuUserName;
  String? idmpuUserGrpId;
  String? idmpuRefNo;
  String? idmpuTransCode;
  String? idmpuPwdCount;
  String? idmpuPrevPassword;
  String? idmpuPwdActiveDate;
  String? idmpuPrvAcl;
  String? idmpuPrvStatus;
  String? idmpuLastLoginTime;
  String? idmpuSQ1Id;
  String? idmpuSq1Ans;
  String? idmpuSq2Id;
  String? idmpuSq2Ans;
  String? idmpuSq3Id;
  String? idmpuSq3Ans;
  String? idmpuSqPriority;
  String? idmpuIndividualInd;
  String? idmpuCompRepInd;
  String? idmpuCompAppInd;
  String? idmpuStaffInd;

  LoginResponse(
      {this.statusCode,
      this.statusMsg,
      this.idmpuUsrId,
      this.idmpuPassWord,
      this.idmpuManutiae,
      this.idmpuStatus,
      this.idmpuAclld,
      this.idmpuUserEmail,
      this.idmpuUserName,
      this.idmpuUserGrpId,
      this.idmpuRefNo,
      this.idmpuTransCode,
      this.idmpuPwdCount,
      this.idmpuPrevPassword,
      this.idmpuPwdActiveDate,
      this.idmpuPrvAcl,
      this.idmpuPrvStatus,
      this.idmpuLastLoginTime,
      this.idmpuSQ1Id,
      this.idmpuSq1Ans,
      this.idmpuSq2Id,
      this.idmpuSq2Ans,
      this.idmpuSq3Id,
      this.idmpuSq3Ans,
      this.idmpuSqPriority,
      this.idmpuIndividualInd,
      this.idmpuCompRepInd,
      this.idmpuCompAppInd,
      this.idmpuStaffInd});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMsg = json['statusMsg'];
    idmpuUsrId = json['idmpuUsrId'];
    idmpuPassWord = json['idmpuPassWord'];
    idmpuManutiae = json['idmpuManutiae'];
    idmpuStatus = json['idmpuStatus'];
    idmpuAclld = json['idmpuAclld'];
    idmpuUserEmail = json['idmpuUserEmail'];
    idmpuUserName = json['idmpuUserName'];
    idmpuUserGrpId = json['idmpuUserGrpId'];
    idmpuRefNo = json['idmpuRefNo'];
    idmpuTransCode = json['idmpuTransCode'];
    idmpuPwdCount = json['idmpuPwdCount'];
    idmpuPrevPassword = json['idmpuPrevPassword'];
    idmpuPwdActiveDate = json['idmpuPwdActiveDate'];
    idmpuPrvAcl = json['idmpuPrvAcl'];
    idmpuPrvStatus = json['idmpuPrvStatus'];
    idmpuLastLoginTime = json['idmpuLastLoginTime'];
    idmpuSQ1Id = json['idmpuSQ1Id'];
    idmpuSq1Ans = json['idmpuSq1Ans'];
    idmpuSq2Id = json['idmpuSq2Id'];
    idmpuSq2Ans = json['idmpuSq2Ans'];
    idmpuSq3Id = json['idmpuSq3Id'];
    idmpuSq3Ans = json['idmpuSq3Ans'];
    idmpuSqPriority = json['idmpuSqPriority'];
    idmpuIndividualInd = json['idmpuIndividualInd'];
    idmpuCompRepInd = json['idmpuCompRepInd'];
    idmpuCompAppInd = json['idmpuCompAppInd'];
    idmpuStaffInd = json['idmpuStaffInd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['statusMsg'] = statusMsg;
    data['idmpuUsrId'] = idmpuUsrId;
    data['idmpuPassWord'] = idmpuPassWord;
    data['idmpuManutiae'] = idmpuManutiae;
    data['idmpuStatus'] = idmpuStatus;
    data['idmpuAclld'] = idmpuAclld;
    data['idmpuUserEmail'] = idmpuUserEmail;
    data['idmpuUserName'] = idmpuUserName;
    data['idmpuUserGrpId'] = idmpuUserGrpId;
    data['idmpuRefNo'] = idmpuRefNo;
    data['idmpuTransCode'] = idmpuTransCode;
    data['idmpuPwdCount'] = idmpuPwdCount;
    data['idmpuPrevPassword'] = idmpuPrevPassword;
    data['idmpuPwdActiveDate'] = idmpuPwdActiveDate;
    data['idmpuPrvAcl'] = idmpuPrvAcl;
    data['idmpuPrvStatus'] = idmpuPrvStatus;
    data['idmpuLastLoginTime'] = idmpuLastLoginTime;
    data['idmpuSQ1Id'] = idmpuSQ1Id;
    data['idmpuSq1Ans'] = idmpuSq1Ans;
    data['idmpuSq2Id'] = idmpuSq2Id;
    data['idmpuSq2Ans'] = idmpuSq2Ans;
    data['idmpuSq3Id'] = idmpuSq3Id;
    data['idmpuSq3Ans'] = idmpuSq3Ans;
    data['idmpuSqPriority'] = idmpuSqPriority;
    data['idmpuIndividualInd'] = idmpuIndividualInd;
    data['idmpuCompRepInd'] = idmpuCompRepInd;
    data['idmpuCompAppInd'] = idmpuCompAppInd;
    data['idmpuStaffInd'] = idmpuStaffInd;
    return data;
  }
}
