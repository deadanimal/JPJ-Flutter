class LoginResponse {
  String? statusCode;
  String? statusMsg;
  String? idmpuUsrId;
  String? idmpuPassword;
  String? idmpuManutiae;
  String? idmpuStatus;
  String? idmpuAclId;
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
  String? idmpuSQ1Ans;
  String? idmpuSQ2Id;
  String? idmpuSQ2Ans;
  String? idmpuSQ3Id;
  String? idmpuSQ3Ans;
  String? idmpuSQPriority;
  String? idmpuIndividualInd;
  String? idmpuCompRepInd;
  String? idmpuCompAppInd;
  String? idmpuStaffInd;

  LoginResponse(
      {this.statusCode,
      this.statusMsg,
      this.idmpuUsrId,
      this.idmpuPassword,
      this.idmpuManutiae,
      this.idmpuStatus,
      this.idmpuAclId,
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
      this.idmpuSQ1Ans,
      this.idmpuSQ2Id,
      this.idmpuSQ2Ans,
      this.idmpuSQ3Id,
      this.idmpuSQ3Ans,
      this.idmpuSQPriority,
      this.idmpuIndividualInd,
      this.idmpuCompRepInd,
      this.idmpuCompAppInd,
      this.idmpuStaffInd});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMsg = json['statusMsg'];
    idmpuUsrId = json['idmpuUsrId'];
    idmpuPassword = json['idmpuPassword'];
    idmpuManutiae = json['idmpuManutiae'];
    idmpuStatus = json['idmpuStatus'];
    idmpuAclId = json['idmpuAclId'];
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
    idmpuSQ1Ans = json['idmpuSQ1Ans'];
    idmpuSQ2Id = json['idmpuSQ2Id'];
    idmpuSQ2Ans = json['idmpuSQ2Ans'];
    idmpuSQ3Id = json['idmpuSQ3Id'];
    idmpuSQ3Ans = json['idmpuSQ3Ans'];
    idmpuSQPriority = json['idmpuSQPriority'];
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
    data['idmpuPassword'] = idmpuPassword;
    data['idmpuManutiae'] = idmpuManutiae;
    data['idmpuStatus'] = idmpuStatus;
    data['idmpuAclId'] = idmpuAclId;
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
    data['idmpuSQ1Ans'] = idmpuSQ1Ans;
    data['idmpuSQ2Id'] = idmpuSQ2Id;
    data['idmpuSQ2Ans'] = idmpuSQ2Ans;
    data['idmpuSQ3Id'] = idmpuSQ3Id;
    data['idmpuSQ3Ans'] = idmpuSQ3Ans;
    data['idmpuSQPriority'] = idmpuSQPriority;
    data['idmpuIndividualInd'] = idmpuIndividualInd;
    data['idmpuCompRepInd'] = idmpuCompRepInd;
    data['idmpuCompAppInd'] = idmpuCompAppInd;
    data['idmpuStaffInd'] = idmpuStaffInd;
    return data;
  }
}
