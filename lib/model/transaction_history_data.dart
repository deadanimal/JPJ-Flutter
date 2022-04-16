class TransactionHistoryData {
  String? id;
  String? date;
  String? transaction;
  bool? hasDoc;
  String? price;
  String? docType;
  String? docLink;

  TransactionHistoryData(
      {this.id,
      this.date,
      this.transaction,
      this.hasDoc,
      this.price,
      this.docType,
      this.docLink});

  TransactionHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    transaction = json['transaction'];
    hasDoc = json['hasDoc'];
    price = json['price'];
    docType = json['docType'];
    docLink = json['docLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['transaction'] = transaction;
    data['hasDoc'] = hasDoc;
    data['price'] = price;
    data['docType'] = docType;
    data['docLink'] = docLink;
    return data;
  }
}
