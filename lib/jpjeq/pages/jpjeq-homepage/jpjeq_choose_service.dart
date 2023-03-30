import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/jpjeq/dummy.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_get_ticket_number_response.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_qr_format.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_service_group_response.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-number-queue/jpjeq_number_queue_controller.dart';
import 'package:jpj_info/jpjeq/services/branch_service.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JpjEqChooseService extends StatefulWidget {
  const JpjEqChooseService({
    Key? key,
    required this.serviceItems,
  }) : super(key: key);

  final JpjEqServiceGroupResponse serviceItems;

  @override
  State<JpjEqChooseService> createState() => _JpjEqChooseServiceState();
}

class _JpjEqChooseServiceState extends State<JpjEqChooseService> {
  String? selectedItem;
  late List<String> selectedItemDetails;
  List<DropdownMenuItem<String>> dropdownItemList = [];

  @override
  void initState() {
    super.initState();
    widget.serviceItems.data2 ??= [];
    selectedItemDetails = [];
    populateDropdownList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView(
            children: [
              _topIcon(context),
              const SizedBox(height: 48),
              _info(context),
              const SizedBox(height: 48),
              _serviceDropdown(context),
              const SizedBox(height: 24),
              _submitButton(context),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  populateDropdownList() {
    for (var el in widget.serviceItems.data2!) {
      dropdownItemList.add(
        DropdownMenuItem<String>(
          value: el.id,
          child: Text(
            el.keterangan ?? "",
            overflow: TextOverflow.clip,
          ),
        ),
      );
    }
    if (widget.serviceItems.data2!.isNotEmpty) {
      selectedItem = widget.serviceItems.data2![0].id;
    }
  }

  List<String> getDetails() {
    List<String> retVal = [];
    selectedItemDetails = [];
    for (var el in widget.serviceItems.data2!) {
      if (el.id == selectedItem) {
        for (var element in el.info!) {
          selectedItemDetails.add(element.keterangan!);
        }
      }
    }
    return retVal;
  }

  Widget _topIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _info(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        AppLocalizations.of(context)!.chooseServiceInfo,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _serviceDropdown(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mediaWidth - 32,
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selectedItemDetails.isEmpty
                ? Colors.white
                : const Color(0xffEBA658),
            width: selectedItemDetails.isEmpty ? 1 : 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
          color: selectedItemDetails.isEmpty
              ? Colors.white
              : const Color(0xffFCF1E1),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 16, 8, 16),
          child: Column(
            children: [
              ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  value: selectedItem,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  isExpanded: true,
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String? val) {
                    setState(() {
                      selectedItem = val;
                      getDetails();
                    });
                  },
                  items: dropdownItemList,
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: selectedItemDetails.length,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(Icons.circle, size: 12),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            '${selectedItemDetails[index]}\n',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: _submitCallback,
        child: Container(
          width: mediaWidth - 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(eqThemeNavy),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
            child: Text(
              AppLocalizations.of(context)!.submit,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitCallback() {
    SharedPreferences.getInstance().then(
      (pref) {
        var qrPayload = pref.getString(LocalStorageHelper().jpjEqQrPayload);
        JpjEqQrFormat qr = JpjEqQrFormat.fromJson(jsonDecode(qrPayload ?? ""));
        BranchService().getTicketNumber(
          context,
          qr.param ?? "",
          qr.idCawangan ?? "",
          int.parse(selectedItem ?? ''),
          (Response res) {
            if (res.statusCode == 200) {
              JpjEqGetTicketNumberResponse ticketResponse =
                  JpjEqGetTicketNumberResponse.fromJson(
                jsonDecode(
                  res.body,
                  // Dummy().getTicketResponse,
                ),
              );

              if (ticketResponse.status == null ||
                  ticketResponse.status == '0') {
                // Store it into shared prefs, So that later we can use it.
                SharedPreferences.getInstance().then(
                  (value) {
                    value
                        .setString(
                      LocalStorageHelper().jpjeQNumberInfo,
                      jsonEncode(ticketResponse.toJson()),
                    )
                        .then(
                      (value1) {
                        if (value1) {
                          value
                              .setString(
                            LocalStorageHelper().jpjeQSelectedService,
                            selectedItem ?? "",
                          )
                              .then((value2) {
                            if (value2) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const JpjEqNumberQueueController();
                                  },
                                ),
                              );
                            }
                          });
                        }
                      },
                    );
                  },
                );
              } else {
                List<String> errString = ticketResponse.mesej!.split("|");
                String err;
                if (errString.length == 1) {
                  err = errString[0];
                } else if (AppLocalizations.of(context)!.localeName == "ms") {
                  err = errString[0];
                } else {
                  err = errString[1];
                }
                AlertController(ctx: context).generalError(
                  err,
                  () {
                    Navigator.pop(context);
                  },
                );
              }
            }
          },
        );
      },
    );
  }
}
