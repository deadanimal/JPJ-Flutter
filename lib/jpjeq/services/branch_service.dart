import 'dart:convert';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_nearby_branches_request.dart';

class BranchService {
  void getNearbyBranchList(
    BuildContext context,
    double lat,
    double lng,
    dynamic Function(Response) callback,
  ) {
    SiteConfig conf = SiteConfig();
    JpjEqNearbyBranchesRequest req = JpjEqNearbyBranchesRequest(
      lat: lat,
      lng: lng,
      playerId: "9999-999-9999-9999",
      tarikh: '1677981571549',
      // tarikh: DateTime.now().millisecondsSinceEpoch.toString(),
      token: '73622a3d24334da476595b3e6bdaad99ba34be43b58a72e58c971e249506de6b',
    );

    jpjHttpRequest(
      context,
      Uri.parse(conf.eQGetBranchList),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: callback,
    );
  }
}
