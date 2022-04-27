import 'package:flutter/widgets.dart';

class CustomMessagesIcon {
  CustomMessagesIcon._();

  static const _kFontFam = 'CustomMessagesIcon';
  static const String? _kFontPkg = null;

  static const IconData markUnreadIcon =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData deleteMsgIcon =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
