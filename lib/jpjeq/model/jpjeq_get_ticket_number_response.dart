class JpjEqGetTicketNumberResponse {
  String? status;
  String? mesej;

  JpjEqGetTicketNumberResponse({
    this.status,
    this.mesej,
  });

  JpjEqGetTicketNumberResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    mesej = json['mesej'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['mesej'] = mesej;
    return data;
  }
}
