import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<String> getIdType(BuildContext context) {
  return [
    AppLocalizations.of(context)!.permanentResident,
    AppLocalizations.of(context)!.malaysian,
    AppLocalizations.of(context)!.police,
    AppLocalizations.of(context)!.military,
    AppLocalizations.of(context)!.company,
    AppLocalizations.of(context)!.newPassword
  ];
}
