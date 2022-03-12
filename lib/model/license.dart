class Licenses {
  late String licenseType;
  late String licenseExpiry;

  Licenses({
    required this.licenseType,
    required this.licenseExpiry,
  });

  factory Licenses.fromJson(Map<String, dynamic> json) => Licenses(
        licenseType: json["jenis_lesen"],
        licenseExpiry: json["tempoh_tamat"],
      );
}

class LicenseInfo {
  late String name;
  late String id;
  late List<Licenses> info;

  LicenseInfo({
    required this.name,
    required this.id,
    required this.info,
  });

  factory LicenseInfo.fromJson(Map<String, dynamic> json) => LicenseInfo(
        id: json["nokp"],
        name: json["nama"],
        info: List<Licenses>.from(
          json["lesen"].map(
            (data) => Licenses.fromJson(data),
          ),
        ),
      );
}
