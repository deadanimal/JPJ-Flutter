import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_branch_by_qr_request.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_branch_service_request.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_get_counter_number_request.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_get_ticket_number_request.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_nearby_branches_request.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_refresh_waiting_time_request.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_request_token.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_service_category_request.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_service_group_request.dart';

class BranchService {
  void getNearbyBranchList(
    BuildContext context,
    double lat,
    double lng,
    dynamic Function(Response) callback,
  ) {
    SiteConfig conf = SiteConfig();
    conf.getJpjEqToken().then((JpjEqRequestToken tokenInfo) {
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
    });
  }

  void getServices(
    BuildContext context,
    String branchId,
    dynamic Function(Response) callback,
  ) {
    SiteConfig conf = SiteConfig();
    conf.getJpjEqToken().then((JpjEqRequestToken value) {
      JpjEqBranchServiceRequest req = JpjEqBranchServiceRequest(
        cawangan: branchId,
        playerId: value.imei,
        tarikh: value.date,
        token: value.token,
      );

      jpjHttpRequest(
        context,
        Uri.parse(conf.eQGetServiceGroup),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
        callback: callback,
      );
    });
  }

  void getServicesKategory(
    BuildContext context,
    String branchId,
    dynamic Function(Response) callback,
  ) {
    SiteConfig conf = SiteConfig();
    conf.getJpjEqToken().then((JpjEqRequestToken value) {
      ServiceCategoryRequest req = ServiceCategoryRequest(
        cawangan: branchId,
        playerId: value.imei,
        tarikh: value.date,
        token: value.token,
      );

      jpjHttpRequest(
        context,
        Uri.parse(conf.eQGetServiceKategory),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
        callback: callback,
      );
    });
  }

  getBranchByQr(
    BuildContext context,
    String param,
    dynamic Function(Response) callback,
  ) {
    SiteConfig conf = SiteConfig();
    conf.getJpjEqToken().then(
      (JpjEqRequestToken value) {
        JpjEqBranchByQrRequest req = JpjEqBranchByQrRequest(
          param: param,
          playerId: value.imei,
          tarikh: value.date,
          token: value.token,
        );

        jpjHttpRequest(
          context,
          Uri.parse(conf.eQGetBranchByQr),
          headers: conf.formHeader,
          body: jsonEncode(req.toJson()),
          callback: callback,
        );
      },
    );
  }

  getServiceGroup(
    BuildContext context,
    String param,
    String branchId,
    dynamic Function(Response) callback,
  ) {
    SiteConfig conf = SiteConfig();
    conf.getJpjEqToken().then(
      (JpjEqRequestToken value) {
        JpjEqServiceGroupRequest req = JpjEqServiceGroupRequest(
          cawangan: branchId,
          playerId: value.imei,
          tarikh: value.date,
          token: value.token,
        );

        jpjHttpRequest(
          context,
          Uri.parse(conf.eQGetServiceGroup),
          headers: conf.formHeader,
          body: jsonEncode(req.toJson()),
          callback: callback,
        );
      },
    );
  }

  getTicketNumber(
    BuildContext context,
    String param,
    String branchId,
    int serviceId,
    dynamic Function(Response) callback,
  ) {
    SiteConfig conf = SiteConfig();
    conf.getJpjEqToken().then(
      (JpjEqRequestToken value) {
        JpjEqGetTicketNumberRequest req = JpjEqGetTicketNumberRequest(
          playerId: value.imei,
          tarikh: value.date,
          token: value.token,
          cawangan: branchId,
          idKumpulanPerkhidmatan: serviceId.toString(),
        );

        jpjHttpRequest(
          context,
          Uri.parse(conf.eQGetTicketNumber),
          headers: conf.formHeader,
          body: jsonEncode(req.toJson()),
          callback: callback,
        );
      },
    );
  }

  Future<Response> refreshWaitingTime(
    String noSiri,
    String branchId,
    String serviceId,
  ) async {
    SiteConfig conf = SiteConfig();
    JpjEqRequestToken value = await conf.getJpjEqToken();
    JpjEqRefreshWaitingTimeRequest req = JpjEqRefreshWaitingTimeRequest(
      playerId: value.imei,
      tarikh: value.date,
      token: value.token,
      cawangan: branchId,
      idKumpulanPerkhidmatan: serviceId,
      noSiri: noSiri,
    );

    Response response = await post(
      Uri.parse(conf.eQRefreshWaitingTime),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
    );

    return response;
  }

  getCounterNumber(
    String branchId,
    String transid,
    dynamic Function(Response) callback,
  ) {
    SiteConfig conf = SiteConfig();
    conf.getJpjEqToken().then(
      (JpjEqRequestToken value) {
        JpjEqGetCounterNumberRequest req = JpjEqGetCounterNumberRequest(
            playerId: value.imei,
            tarikh: value.date,
            token: value.token,
            cawangan: branchId,
            transid: transid);

        jpjSilentHttpRequest(
          Uri.parse(conf.eQgetCounterNumber),
          headers: conf.formHeader,
          body: jsonEncode(req.toJson()),
          callback: callback,
        );
      },
    );
  }

  cancelTicket(
    BuildContext context,
    String param,
    String branchId,
    String serviceId,
    dynamic Function(Response) callback,
  ) {
    SiteConfig conf = SiteConfig();
    conf.getJpjEqToken().then(
      (JpjEqRequestToken value) {
        JpjEqGetTicketNumberRequest req = JpjEqGetTicketNumberRequest(
          playerId: value.imei,
          tarikh: value.date,
          token: value.token,
          cawangan: branchId,
          idKumpulanPerkhidmatan: serviceId,
        );

        jpjHttpRequest(
          context,
          Uri.parse(conf.eQCancelNumber),
          headers: conf.formHeader,
          body: jsonEncode(req.toJson()),
          callback: callback,
        );
      },
    );
  }
}
