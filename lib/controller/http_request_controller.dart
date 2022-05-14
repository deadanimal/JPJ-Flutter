import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void jpjHttpRequest(
  BuildContext context,
  Uri url, {
  Map<String, String>? headers,
  Object? body,
  Function(http.Response)? callback,
}) {
  EasyLoading.show(
    status: AppLocalizations.of(context)!.pleaseWait,
  );
  http.post(url, headers: headers, body: body).then(
    (value) {
      if (callback != null) {
        callback(value);
      }
    },
  ).onError((error, stackTrace) {
    AlertController(ctx: context).connectionError();
  }).timeout(
    const Duration(seconds: 15),
    onTimeout: (() {
      AlertController(ctx: context).connectionError();
    }),
  ).whenComplete(() {
    EasyLoading.dismiss();
  });
}
