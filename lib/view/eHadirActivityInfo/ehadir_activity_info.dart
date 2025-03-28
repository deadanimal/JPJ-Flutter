import 'package:flutter/material.dart';
import 'package:jpj_info/model/ehadir/activity_list_res.dart';
import 'package:jpj_info/model/ehadir/comittee_list_res.dart';
import 'package:jpj_info/model/ehadir_basic_user_info.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/eHadirActivityInfo/component/attendance_list.dart';
import 'package:jpj_info/view/eHadirActivityInfo/component/comittee_list.dart';
import 'package:jpj_info/view/eHadirActivityInfo/component/info_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/template/template_header.dart';

class EhadirActivityInfo extends StatelessWidget {
  const EhadirActivityInfo({
    Key? key,
    required this.tabController,
    required this.qrScanCallback,
    required this.event,
    required this.comitteeList,
    required this.addMemberFx,
    required this.refreshFx,
    required this.attendeeList,
    required this.addAttendeeManual,
    required this.eraseAttendee,
    required this.eraseCommittee,
  }) : super(key: key);
  final TabController tabController;
  final Function qrScanCallback;
  final Aktiviti event;
  final List<ComitteeListRes> comitteeList;
  final List<BasicUserInfo> attendeeList;
  final Function(BuildContext, int, String) addMemberFx;
  final Function() refreshFx;
  final Function() addAttendeeManual;
  final Function(int) eraseAttendee;
  final Function(int) eraseCommittee;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.committeeDetail,
          ),
          const SizedBox(height: vPaddingXL),
          _tabHeader(context),
          Container(
              constraints: BoxConstraints(maxHeight: mediaHeight * 0.75),
              child: _tabView(context)),
          const SizedBox(height: vPaddingXL),
        ],
      ),
    );
  }

  Widget _tabHeader(BuildContext context) {
    return TabBar(
      labelColor: const Color(themeGray),
      indicatorColor: const Color(themeNavy),
      unselectedLabelColor: Colors.grey.shade400,
      controller: tabController,
      tabs: [
        FittedBox(
          child: Text(
            AppLocalizations.of(context)!.info,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
        ),
        FittedBox(
          child: Text(
            AppLocalizations.of(context)!.comittee,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
        ),
        FittedBox(
          child: Text(
            AppLocalizations.of(context)!.attendance,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
        ),
      ],
    );
  }

  Widget _tabView(BuildContext context) {
    List<BasicUserInfo> comittees = [];
    for (var el in comitteeList) {
      comittees.add(BasicUserInfo(
        el.id!,
        el.nama!,
        el.namabahagian,
      ));
    }
    return SizedBox(
      width: mediaWidth - 64,
      child: TabBarView(
        controller: tabController,
        children: [
          InfoTab(
            event: event,
            refreshFx: refreshFx,
          ),
          ComitteeList(
            activityId: event.id!,
            comitteeList: comittees,
            transidAktiviti: event.transidAktiviti!,
            addMemberFx: addMemberFx,
            eraseItem: eraseCommittee,
          ),
          AttendanceList(
            qrScanCallback: qrScanCallback,
            activityId: event.id!,
            transidAktiviti: event.transidAktiviti!,
            attendeeList: attendeeList,
            addAttendeeManual: addAttendeeManual,
            eraseItem: eraseAttendee,
          ),
        ],
      ),
    );
  }
}
