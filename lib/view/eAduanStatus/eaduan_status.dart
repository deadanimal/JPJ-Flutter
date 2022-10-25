import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jpj_info/model/aduan_draft.dart';
import 'package:jpj_info/model/aduan_status_response.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/eAduanStatus/component/status_card_view.dart';

class EaduanStatus extends StatelessWidget {
  const EaduanStatus({
    Key? key,
    required this.tabController,
    required this.res,
    required this.draftList,
    required this.eraseDraftCallback,
    required this.editDraftCallback,
    required this.editSentCallback,
  }) : super(key: key);
  final TabController tabController;
  final List<AduanStatusResponse> res;
  final List<AduanDraft> draftList;
  final Function(String) eraseDraftCallback;
  final Function(String) editDraftCallback;
  final Function(String) editSentCallback;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SizedBox(
      width: mediaWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: vPaddingXL),
          Text(
            AppLocalizations.of(context)!.listOfComplaint,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff171f44),
              fontSize: 24,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
          const SizedBox(height: vPaddingXL),
          _tabTitle(context),
          Expanded(child: _tabView(context)),
        ],
      ),
    );
  }

  Widget _tabTitle(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      width: mediaWidth,
      child: TabBar(
        labelColor: const Color(themeGray),
        indicatorColor: const Color(themeNavy),
        unselectedLabelColor: Colors.grey.shade400,
        controller: tabController,
        tabs: [
          Text(
            AppLocalizations.of(context)!.sent,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.draft,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabView(BuildContext context) {
    return Container(
      width: mediaWidth,
      constraints: const BoxConstraints(maxWidth: 400),
      child: TabBarView(
        controller: tabController,
        children: [
          _sentTab(context),
          _draftTab(context),
        ],
      ),
    );
  }

  Widget _sentTab(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: res.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return StatusCardView(
          complaintId: res[index].noAduan.toString().trim(),
          date: res[index].tarikh!,
          time: res[index].masa!,
          offense: res[index].kesalahan!,
          width: mediaWidth - 64,
          leading: _status(context, res[index].keteranganStatus!),
          trailing: _searchIcon(
              res[index].noAduan!.toString(), res[index].keteranganStatus!),
        );
      },
    );
  }

  Widget _draftTab(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: draftList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        AduanDraft el = draftList[index];
        DateTime dateTime = DateTime.parse(el.id!);
        return StatusCardView(
          width: mediaWidth - 64,
          leading: _draftStatus(context),
          trailing: _draftIcon(el.id!),
          date: DateFormat('dd-MM-yyyy').format(dateTime),
          time: DateFormat('kk:mm a').format(dateTime),
          offense: el.details!.idkesalahan!,
        );
      },
    );
  }

  Widget _status(BuildContext context, String status) {
    Map<String, dynamic> statusMap = {
      "BARU": Colors.green,
      "MAKLUMAT TIDAK LENGKAP": Colors.red,
      "MAKLUMAT TELAH DIKEMASKINI": Colors.blue,
      "SELESAI": Colors.purple,
      "TUTUP": Colors.grey,
    };
    return Container(
      color: statusMap[status],
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          status,
          style: TextStyle(
            backgroundColor: statusMap[status],
            fontSize: 15,
            fontFamily: "Roboto",
          ),
        ),
      ),
    );
  }

  Widget _draftStatus(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          AppLocalizations.of(context)!.draft,
          style: const TextStyle(
            fontSize: 15,
            fontFamily: "Roboto",
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _searchIcon(String id, String status) {
    return status == "MAKLUMAT TIDAK LENGKAP"
        ? SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(vPaddingM),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xff157ad8),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        editSentCallback(id);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.edit_note_outlined),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }

  Widget _draftIcon(String id) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(vPaddingM),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff157ad8),
              ),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  editDraftCallback(id);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.edit_note_outlined),
                  ],
                ),
              ),
            ),
            const SizedBox(width: vPaddingS),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.red,
              ),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  eraseDraftCallback(id);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.delete_outline_outlined),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
