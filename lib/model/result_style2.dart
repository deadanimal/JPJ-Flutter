import 'package:flutter/cupertino.dart';

class ResultStyle2 {
  String? title;
  String? subtitle;
  String? name;
  String? id;
  String? vehicalRegNumber;
  List<Result2> results;

  ResultStyle2({
    required this.title,
    required this.subtitle,
    required this.name,
    required this.id,
    required this.vehicalRegNumber,
    required this.results,
  });
}

class Result2 {
  late String? title;
  late Widget result;

  Result2({
    required this.title,
    required this.result,
  });
}
