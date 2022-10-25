import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/eaduan_form_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/controller/prompt_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/eaduan_draft.dart';
import 'package:jpj_info/model/aduan_draft.dart';
import 'package:jpj_info/model/aduan_get_response.dart';
import 'package:jpj_info/model/aduan_status_response.dart';
import 'package:jpj_info/model/check_id_request.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/eAduanStatus/eaduan_status.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class EaduanStatusController extends StatefulWidget {
  const EaduanStatusController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EaduanStatusController();
}

class _EaduanStatusController extends State<EaduanStatusController>
    with TickerProviderStateMixin {
  late TabController tabController;
  late List<AduanStatusResponse> res = [];
  late List<AduanDraft> draftList = [];
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      getComplaintList();
      getDraftList();
    });
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: EaduanStatus(
          tabController: tabController,
          res: res,
          draftList: draftList,
          eraseDraftCallback: eraseDraft,
          editDraftCallback: editDraft,
          editSentCallback: updateReport,
        ),
        bottomNavigationBar: const BottomNavController(),
      ),
    );
  }

  _responseHandler(http.Response response) {
    if (response.statusCode == 200) {
      for (var element in jsonDecode(response.body)) {
        res.add(AduanStatusResponse.fromJson(element));
      }
      setState(() {
        res;
      });
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  void getComplaintList() {
    SiteConfig conf = SiteConfig();
    CheckIdRequest req = CheckIdRequest(nokp: MyJPJAccountManager().id);
    jpjHttpRequest(
      context,
      Uri.parse(conf.aduanStatusUri),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: _responseHandler,
    );
  }

  String? parseIdToComplaint(EaduanItem id) {
    Map<EaduanItem, String> offense = {
      EaduanItem.redLight: AppLocalizations.of(context)!.failToFollowRedLight,
      EaduanItem.emergencyLane:
          AppLocalizations.of(context)!.emergencyLaneDriving,
      EaduanItem.cutQueue: AppLocalizations.of(context)!.skipQueue,
      EaduanItem.leftOvertake: AppLocalizations.of(context)!.leftOvertake,
      EaduanItem.doubleLine: AppLocalizations.of(context)!.doubleLineOvertake,
      EaduanItem.usingPhone:
          AppLocalizations.of(context)!.usingPhoneWhileDriving,
      EaduanItem.fancyPlate: AppLocalizations.of(context)!.fancyPlateNumber,
      EaduanItem.darkTint: AppLocalizations.of(context)!.darkTint,
      EaduanItem.seatBelt: AppLocalizations.of(context)!.notWearingSeatbelt,
    };

    return offense[id];
  }

  void eraseDraft(String id) {
    PromptController(
      ctx: context,
    ).prompt(
      AppLocalizations.of(context)!.removeFromDraft,
      () async {
        Navigator.of(context).pop();
        await EAduanDraft().erase(id);
        getDraftList();
      },
      () {
        Navigator.of(context).pop();
      },
      noString: AppLocalizations.of(context)!.no,
      okString: AppLocalizations.of(context)!.yes,
    );
  }

  void getDraftList() async {
    draftList = await EAduanDraft().getDraftList();
    for (var el in draftList) {
      EaduanItem f = EaduanItem.values.firstWhere(
        (e) {
          return e.toString() == el.details!.idkesalahan;
        },
        orElse: () {
          return EaduanItem.usingPhone;
        },
      );
      el.details!.idkesalahan = parseIdToComplaint(f);
    }
    setState(() {});
  }

  void editDraft(String id) {
    EAduanDraft().get(id).then((value) {
      EaduanItem itemId = EaduanItem.values.firstWhere(
        (e) {
          return e.toString() == value.details!.idkesalahan;
        },
        orElse: () {
          return EaduanItem.usingPhone;
        },
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return EaduanFormController(
              itemClass: itemId,
              draft: value,
              id: value.id,
            );
          },
        ),
      );
    });
  }

  void updateReport(String reportId) {
    SiteConfig conf = SiteConfig();
    jpjHttpGetRequest(
      context,
      Uri.parse(conf.updateAduan + reportId),
      headers: conf.formHeader,
      callback: (http.Response response) {
        if (response.statusCode == 200) {
          AduanGetResponse res = AduanGetResponse.fromJson(
            jsonDecode(response.body),
          );
          if (res.id != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  List<EaduanItem> items = [
                    EaduanItem.redLight,
                    EaduanItem.emergencyLane,
                    EaduanItem.cutQueue,
                    EaduanItem.leftOvertake,
                    EaduanItem.doubleLine,
                    EaduanItem.usingPhone,
                    EaduanItem.fancyPlate,
                    EaduanItem.darkTint,
                    EaduanItem.seatBelt,
                  ];
                  return EaduanFormController(
                    itemClass: items[res.jenisKesalahan! - 1],
                    editData: res,
                  );
                },
              ),
            );
          } else {
            AlertController(ctx: context).generalError(
              AppLocalizations.of(context)!.errorPleaseTryAgain,
              () {
                Navigator.pop(context);
              },
            );
          }
        } else {
          AlertController(ctx: context).connectionError();
        }
      },
    );
  }
}
