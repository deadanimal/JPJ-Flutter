import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/helper/yes_no_prompt.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/dummy.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_branch_by_qr_response.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_get_counter_number_response.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_get_ticket_number_response.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_history_model.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_qr_format.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_refresh_waiting_time_response.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-homepage/jpjeq_homepage_controller.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-number-called/jpjeq_number_call_controller.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-number-queue/jpjeq_number_queue.dart';
import 'package:jpj_info/jpjeq/services/branch_service.dart';
import 'package:jpj_info/jpjeq/services/history_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JpjEqNumberQueueController extends StatefulWidget {
  const JpjEqNumberQueueController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqNumberQueueController();
}

class _JpjEqNumberQueueController extends State<JpjEqNumberQueueController> {
  JpjEqGetTicketNumberResponse ticketInfo = JpjEqGetTicketNumberResponse();
  JpjEqGetBrancheByQrResponse branchInfo = JpjEqGetBrancheByQrResponse();
  late Timer? t;
  @override
  void initState() {
    super.initState();
    getNumberInfo();
  }

  @override
  void dispose() {
    if (t != null) {
      t!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: JpjEqNumberQueue(
          ticketInfo: ticketInfo,
          cancelCB: cancel,
          branchInfo: branchInfo,
        ),
        bottomNavigationBar: const JpjEqBottomNavController(),
      ),
    );
  }

  getNumberInfo() {
    SharedPreferences.getInstance().then(
      (value) async {
        String? rawValue = value.getString(
          LocalStorageHelper().jpjeQNumberInfo,
        );

        String? rawValueBranch = value.getString(
          LocalStorageHelper().jpjEqBranchInfo,
        );
        if (rawValueBranch != null) {
          branchInfo =
              JpjEqGetBrancheByQrResponse.fromJson(jsonDecode(rawValueBranch));
          JPJEqHistory item = await JPJEqHistoryService.getLatest();
          item.branchName = branchInfo.data![0].namaCawangan;
          await JPJEqHistoryService.update(item);
        }

        if (rawValue != null) {
          setState(() {
            ticketInfo = JpjEqGetTicketNumberResponse.fromJson(
              jsonDecode(
                rawValue,
              ),
            );
          });

          // // Workmanager not able to save to shared preferences. So check for refreshMasaMenunggu is done in this page.
          // // Onesignal message will open number called page, so no need to check for refreshMasaMenunggu in background.

          // Workmanager().registerPeriodicTask(
          //   "task2",
          //   "eqCheckNumberRefresh",
          //   frequency: const Duration(minutes: 15),
          //   initialDelay: const Duration(seconds: 1),
          //   constraints: Constraints(networkType: NetworkType.connected),
          // );

          Future.delayed(
            const Duration(milliseconds: 15000),
            checkForChanges,
          );
        } else {}
      },
    );
  }

  checkForChanges() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? selectedService = sharedPreferences.getString(
      LocalStorageHelper().jpjeQSelectedService,
    );
    var response = await BranchService().refreshWaitingTime(
      ticketInfo.noSiri ?? "",
      ticketInfo.cawangan ?? "",
      selectedService ?? "",
    );

    if (response.statusCode == 200) {
      JpjEqRefreshWaitingTimeResponse refreshData =
          JpjEqRefreshWaitingTimeResponse.fromJson(
        jsonDecode(
          response.body,
          // Dummy().refreshWaitingTime,
        ),
      );
      setState(() {
        ticketInfo.cawangan = refreshData.cawangan;
        ticketInfo.kedudukanMenunggu = refreshData.kedudukanMenunggu;
        ticketInfo.noSekarang = refreshData.noSekarang;
        ticketInfo.masaMenunggu = refreshData.masaMenunggu;
      });

      if (refreshData.noSekarang != null &&
          refreshData.noSekarang == ticketInfo.noTiketAnda) {
        var qrPayload =
            sharedPreferences.getString(LocalStorageHelper().jpjEqQrPayload);
        JpjEqQrFormat qr = JpjEqQrFormat.fromJson(jsonDecode(qrPayload ?? ""));
        BranchService().getCounterNumber(
          qr.idCawangan.toString(),
          ticketInfo.transid.toString(),
          (res) async {
            if (res.statusCode == 200) {
              JpjEqGetCounterNumberResponse response =
                  JpjEqGetCounterNumberResponse.fromJson(
                jsonDecode(
                  res.body,
                  // Dummy().getCounterResponse,
                ),
              );
              if (response.status == 0) {
                if (t != null) {
                  t!.cancel();
                }

                JPJEqHistory item = await JPJEqHistoryService.getLatest();
                item.callTime = DateTime.now().toString();
                item.counter = response.kaunter;
                item.status = "Called";
                JPJEqHistoryService.update(item).then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return JpjEqNumberCallController(
                          counter: int.parse(response.kaunter ?? ""),
                          number: int.parse(ticketInfo.noTiketAnda ?? '0'),
                        );
                      },
                    ),
                  ).then((value) {
                    t = Timer(const Duration(seconds: 15), () {
                      checkForChanges();
                    });
                  });
                });
              }
            }
          },
        );
      }
    }

    t = Timer(const Duration(seconds: 15), () {
      checkForChanges();
    });
  }

  cancel() {
    YesNoPrompter()
        .prompt(
            context,
            Text(
              AppLocalizations.of(context)!.cancelB,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: "Roboto",
              ),
            ))
        .then(
      (bool selection) async {
        if (selection) {
          SharedPreferences.getInstance().then(
            (pref) async {
              var qrPayload =
                  pref.getString(LocalStorageHelper().jpjEqQrPayload);
              String? selectedService = pref.getString(
                LocalStorageHelper().jpjeQSelectedService,
              );
              JpjEqQrFormat qr =
                  JpjEqQrFormat.fromJson(jsonDecode(qrPayload ?? ""));
              BranchService().cancelTicket(
                context,
                qr.param ?? "",
                qr.idCawangan ?? "",
                selectedService ?? "",
                (p0) async {
                  var sharedPreff = await SharedPreferences.getInstance();
                  sharedPreff
                      .remove(
                    LocalStorageHelper().jpjeQNumberInfo,
                  )
                      .then(
                    (value) async {
                      JPJEqHistory item = await JPJEqHistoryService.getLatest();
                      item.callTime = DateTime.now().toString();
                      item.status = "Canceled";
                      JPJEqHistoryService.update(item).then((value) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const JpjEqHomepageController();
                            },
                          ),
                        );
                      });
                    },
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
