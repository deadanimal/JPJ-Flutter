class ResultStyle1 {
  String? title;
  String? subtitle;
  String? name;
  String? id;
  List<Result1> results;

  ResultStyle1({
    required this.title,
    required this.subtitle,
    required this.name,
    required this.id,
    required this.results,
  });
}

class Result1 {
  late String? leftTitle;
  late String? rightTitle;
  late String? leftContent;
  late String? rightContent;

  Result1({
    required this.leftTitle,
    required this.rightTitle,
    required this.leftContent,
    required this.rightContent,
  });
}
