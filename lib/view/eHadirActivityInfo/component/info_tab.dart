import 'package:flutter/material.dart';
import 'package:jpj_info/controller/ehadir_add_activity_controller.dart';
import 'package:jpj_info/helper/string_helper.dart';
import 'package:jpj_info/model/ehadir/activity_list_res.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/summonsVerification/component/bordered_container.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({
    Key? key,
    required this.event,
    required this.refreshFx,
  }) : super(key: key);
  final Aktiviti event;
  final Function() refreshFx;

  @override
  Widget build(BuildContext context) {
    var date = _parseDateString(event.tarikhMula ?? "");
    if (event.tarikhTamat != null && event.tarikhTamat != event.tarikhMula) {
      date += ' - ${_parseDateString(event.tarikhTamat ?? "")}';
    }
    return ListView(
      children: [
        CustomBorderedContainer(
          padding: const EdgeInsets.all(0),
          width: mediaWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  color: Color(0xfff54d2a),
                ),
                child: Text(
                  capitalize(event.namaAktiviti!),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: vPaddingXL),
              PrettyQr(
                image: const AssetImage("images/icon/jpjehadir.png"),
                size: 200,
                data:
                    "https://egate.jpj.gov.my/ehadir/umum/daftar_pengguna_qr/${event.transidAktiviti}",
                errorCorrectLevel: QrErrorCorrectLevel.M,
                roundEdges: true,
                elementColor: const Color(themeNavy),
              ),
              const SizedBox(height: vPaddingXL),
              Text(
                "${event.user != null ? capitalize(event.user!.nama!) : ""}\n${event.lokasi == null ? "" : capitalize(event.lokasi!)}\n$date\n${_getEventSessions()}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.fromLTRB(8, 2, 16, 16), // all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return EhadirAddActivityController(
                                  activityId: event.id!);
                            },
                          ),
                        ).then((value) => {refreshFx()});
                      },
                      backgroundColor: const Color(themeNavy),
                      child: const Icon(Icons.edit),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getEventSessions() {
    String retVal = '';
    if (event.masaSesi != null) {
      for (int i = 0; i < event.masaSesi!.length; i++) {
        retVal +=
            'SESI ${i + 1}: ${event.masaSesi![i].masaMula!}-${event.masaSesi![i].masaTamat!}';
        if (i != event.masaSesi!.length - 1) {
          retVal += '\n';
        }
      }
    }
    retVal = retVal;
    return retVal;
  }

  String _parseDateString(String raw) {
    List<String> retVal = raw.split('-');

    return "${retVal[2]}-${retVal[1]}-${retVal[0]}";
  }
}
