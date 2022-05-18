import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/result_style2.dart';
import 'package:jpj_info/model/roadtax_status_request.dart';
import 'package:jpj_info/model/roadtax_status_response.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/template/template_result2.dart';

class RoadTaxRequestController {
  RoadTaxRequestController(
    BuildContext context,
    int categoryIndex,
    String nric,
    String plateNumber,
  ) {
    SiteConfig conf = SiteConfig();

    RoadTaxStatusRequest req = RoadTaxStatusRequest(
      kategori: categoryIndex.toString(),
      nokp: nric,
      nokenderaan: plateNumber,
    );
    jpjHttpRequest(
      context,
      Uri.parse(conf.roadTaxCheckUri),
      headers: conf.jsonHeader,
      body: jsonEncode(req.toJson()),
      callback: (response) {
        _responseHandler(context, response);
      },
    );
  }
  void _responseHandler(BuildContext context, http.Response response) {
    if (response.statusCode == 200) {
      RoadTaxStatusResponse respond = RoadTaxStatusResponse.fromJson(
        jsonDecode(response.body),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            List<Result2> dataSet = [];
            if (respond.lkm != null) {
              for (int i = 0; i < respond.lkm!.length; i++) {
                if (!MyJPJAccountManager().isLoggedIn && i == 0) {
                } else {
                  dataSet.add(
                    Result2(
                      result: _resultField(context, respond.lkm![i]),
                      title: respond.lkm![i].velinsuran,
                    ),
                  );
                }
              }
            }

            ResultStyle2 result = ResultStyle2(
              id: respond.nokp,
              name: respond.nama,
              results: dataSet,
              subtitle: AppLocalizations.of(context)!.searchResult,
              title: AppLocalizations.of(context)!.lkm,
              vehicalRegNumber: respond.nokenderaan,
            );
            return TemplateResult2(
              data: result,
            );
          },
        ),
      );
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  Widget _resultField(BuildContext context, Lkm el) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.startDate,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Color(0xff8b9eb0),
                  fontSize: 12,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                el.tarikhcomment!,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Color(0xff4e4e4e),
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.expiryDate,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Color(0xff8b9eb0),
                  fontSize: 12,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                el.expiredate!.trim(),
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Color(0xff4e4e4e),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
