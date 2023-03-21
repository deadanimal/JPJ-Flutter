import 'dart:convert';
import 'package:device_information/device_information.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_branch_service_request.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_nearby_branches_request.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_request_token.dart';

class BranchService {
  Future<void> getNearbyBranchList(
    BuildContext context,
    double lat,
    double lng,
    dynamic Function(Response) callback,
  ) async {
    SiteConfig conf = SiteConfig();
    JpjEqRequestToken tokenInfo = await conf.getJpjEqToken();
    JpjEqNearbyBranchesRequest req = JpjEqNearbyBranchesRequest(
      lat: lat,
      lng: lng,
      playerId: tokenInfo.imei,
      tarikh: tokenInfo.date,
      token: tokenInfo.token,
    );

    jpjHttpRequest(
      context,
      Uri.parse(conf.eQGetBranchList),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: callback,
    );
  }

  void getServices(
    BuildContext context,
    String branchId,
    dynamic Function(Response) callback,
  ) {
    SiteConfig conf = SiteConfig();
    JpjEqBranchServiceRequest req = JpjEqBranchServiceRequest(
      cawangan: branchId,
      playerId: "9999-999-9999-9999",
      tarikh: '1677981571549',
      // tarikh: DateTime.now().millisecondsSinceEpoch.toString(),
      token: '73622a3d24334da476595b3e6bdaad99ba34be43b58a72e58c971e249506de6b',
    );

    jpjHttpRequest(
      context,
      Uri.parse(conf.eQGetBranchService),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: callback,
    );
  }
}
