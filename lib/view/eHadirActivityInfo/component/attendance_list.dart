import 'package:flutter/material.dart';
import 'package:jpj_info/model/ehadir_basic_user_info.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/eHadirActivityInfo/component/ehadir_people_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AttendanceList extends StatelessWidget {
  const AttendanceList({
    Key? key,
    required this.attendeeList,
    required this.qrScanCallback,
    required this.activityId,
    required this.transidAktiviti,
    required this.addAttendeeManual,
  }) : super(key: key);
  final List<BasicUserInfo> attendeeList;
  final Function qrScanCallback;
  final int activityId;
  final String transidAktiviti;
  final Function() addAttendeeManual;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _addAttendanceBtn(context),
        PeopleList(comitteeList: attendeeList),
      ],
    );
  }

  Widget _addAttendanceBtn(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: _addBtn(
            context,
            AppLocalizations.of(context)!.scanQr,
            qrScanCallback,
            const AssetImage("images/icon/ehadir_scan_qr_icon.png"),
          ),
        ),
        Expanded(
          flex: 5,
          child: _addBtn(
            context,
            AppLocalizations.of(context)!.manualRegistration,
            // () => eHadirManualRegisterPage(
            //   context,
            //   activityId,
            //   transidAktiviti,
            // ),
            () {
              addAttendeeManual();
            },
            const AssetImage("images/icon/ehadir_manual_register_icon.png"),
          ),
        ),
      ],
    );
  }

  Widget _addBtn(
    BuildContext context,
    String label,
    Function callback,
    AssetImage icon,
  ) {
    return Padding(
      padding: const EdgeInsets.all(vPaddingM),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffe3e3e3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(vPaddingXs),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              callback();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: icon),
                  FittedBox(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(themeNavy),
                        fontSize: 12,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
