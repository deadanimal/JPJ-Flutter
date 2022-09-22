class TestResultResponse {
  int? status;
  String? icno;
  String? category;
  String? name;
  List<TheoryTest>? theoryTest;
  List<PracticalTest>? practicalTest;

  TestResultResponse({
    this.status,
    this.icno,
    this.category,
    this.name,
    this.theoryTest,
    this.practicalTest,
  });

  TestResultResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    icno = json['icno'];
    category = json['category'];
    name = json['name'];
    if (json['theory_test'] != null) {
      theoryTest = <TheoryTest>[];
      json['theory_test'].forEach((v) {
        theoryTest?.add(TheoryTest.fromJson(v));
      });
    }
    if (json['practical_test'] != null) {
      practicalTest = <PracticalTest>[];
      json['practical_test'].forEach((v) {
        practicalTest?.add(PracticalTest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['icno'] = icno;
    data['category'] = category;
    data['name'] = name;
    if (theoryTest != null) {
      data['theory_test'] = theoryTest?.map((v) => v.toJson()).toList();
    }
    if (practicalTest != null) {
      data['practical_test'] = practicalTest?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TheoryTest {
  String? testDate;
  String? testType;
  String? testVenue;
  String? testResult;
  String? theoryTestMarks;
  String? overAllResult;
  String? expiryDate;
  String? statusVerification;
  String? testCode;
  String? licenseType;
  String? classType;

  TheoryTest({
    this.testDate,
    this.testType,
    this.testVenue,
    this.testResult,
    this.theoryTestMarks,
    this.overAllResult,
    this.expiryDate,
    this.statusVerification,
    this.testCode,
    this.licenseType,
    this.classType,
  });

  TheoryTest.fromJson(Map<String, dynamic> json) {
    testDate = json['testDate'];
    testType = json['testType'];
    testVenue = json['testVenue'];
    testResult = json['testResult'];
    theoryTestMarks = json['theoryTestMarks'];
    overAllResult = json['overAllResult'];
    expiryDate = json['expiryDate'];
    statusVerification = json['statusVerification'];
    testCode = json['testCode'];
    licenseType = json['licenseType'];
    classType = json['classType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['testDate'] = testDate;
    data['testType'] = testType;
    data['testVenue'] = testVenue;
    data['testResult'] = testResult;
    data['theoryTestMarks'] = theoryTestMarks;
    data['overAllResult'] = overAllResult;
    data['expiryDate'] = expiryDate;
    data['statusVerification'] = statusVerification;
    data['testCode'] = testCode;
    data['licenseType'] = licenseType;
    data['classType'] = classType;
    return data;
  }
}

class PracticalTest {
  String? testDate;
  String? testType;
  String? licenseType;
  String? licenseClass;
  String? usageCode;
  String? testVenue;
  String? overAllResult;
  String? expiryDate;
  String? testCode;

  PracticalTest({
    this.testDate,
    this.testType,
    this.licenseType,
    this.licenseClass,
    this.usageCode,
    this.testVenue,
    this.overAllResult,
    this.expiryDate,
    this.testCode,
  });

  PracticalTest.fromJson(Map<String, dynamic> json) {
    testDate = json['testDate'];
    testType = json['testType'];
    licenseType = json['licenseType'];
    licenseClass = json['licenseClass'];
    usageCode = json['usageCode'];
    testVenue = json['testVenue'];
    overAllResult = json['overAllResult'];
    expiryDate = json['expiryDate'];
    testCode = json['testCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['testDate'] = testDate;
    data['testType'] = testType;
    data['licenseType'] = licenseType;
    data['licenseClass'] = licenseClass;
    data['usageCode'] = usageCode;
    data['testVenue'] = testVenue;
    data['overAllResult'] = overAllResult;
    data['expiryDate'] = expiryDate;
    data['testCode'] = testCode;
    return data;
  }
}
