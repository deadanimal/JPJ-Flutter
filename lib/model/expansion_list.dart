import 'package:jpj_info/model/summons_response.dart';

class CustomExpensionList {
  CustomExpensionList({
    required this.data,
    this.isExpanded = false,
  });
  late bool isExpanded;
  late Summons data;
}
