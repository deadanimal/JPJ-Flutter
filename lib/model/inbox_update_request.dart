class InboxUpdateRequest {
  String? idNoti;
  String? status;

  InboxUpdateRequest({
    this.idNoti,
    this.status,
  });

  InboxUpdateRequest.fromJson(Map<String, dynamic> json) {
    idNoti = json['id_noti'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_noti'] = idNoti;
    data['status'] = status;
    return data;
  }
}
