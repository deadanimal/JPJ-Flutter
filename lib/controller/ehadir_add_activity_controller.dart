import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/ehadir_session_check.dart';
import 'package:jpj_info/helper/string_helper.dart';
import 'package:jpj_info/model/ehadir/activity_list_res.dart';
import 'package:jpj_info/model/ehadir/edit_activiti_req.dart';
import 'package:jpj_info/model/ehadir/new_activity_req.dart';
import 'package:jpj_info/model/ehadir/new_activity_res.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/eHadirAddActivity/ehadir_add_activity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;

class EhadirAddActivityController extends StatefulWidget {
  const EhadirAddActivityController({
    Key? key,
    this.activityId,
  }) : super(key: key);

  final int? activityId;

  @override
  State<StatefulWidget> createState() => _EhadirAddActivityController();
}

class _EhadirAddActivityController extends State<EhadirAddActivityController> {
  late TextEditingController activityName;
  late TextEditingController noOfDays;
  late TextEditingController date;
  late TextEditingController sessionPerDay;
  late TextEditingController startTime;
  late TextEditingController endTime;
  late TextEditingController startTime1;
  late TextEditingController endTime1;
  late TextEditingController startTime2;
  late TextEditingController endTime2;
  late TextEditingController startTime3;
  late TextEditingController endTime3;
  late TextEditingController location;
  late TextEditingController latitude;
  late TextEditingController longitude;
  late TextEditingController agenda;
  late String selectedDate;
  late String endDate;

  @override
  void initState() {
    super.initState();
    activityName = TextEditingController();
    noOfDays = TextEditingController();
    date = TextEditingController();
    sessionPerDay = TextEditingController();
    sessionPerDay.text = '1';
    startTime = TextEditingController();
    endTime = TextEditingController();
    startTime1 = TextEditingController();
    endTime1 = TextEditingController();
    startTime2 = TextEditingController();
    endTime2 = TextEditingController();
    startTime3 = TextEditingController();
    endTime3 = TextEditingController();
    location = TextEditingController();
    latitude = TextEditingController();
    longitude = TextEditingController();
    agenda = TextEditingController();
    selectedDate = '';

    if (widget.activityId != null) {
      Future.delayed(
        const Duration(milliseconds: 250),
        _getActivity,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    activityName.dispose();
    noOfDays.dispose();
    date.dispose();
    sessionPerDay.dispose();
    startTime.dispose();
    endTime.dispose();
    startTime1.dispose();
    endTime1.dispose();
    startTime2.dispose();
    endTime2.dispose();
    startTime3.dispose();
    endTime3.dispose();
    location.dispose();
    latitude.dispose();
    longitude.dispose();
    agenda.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: EhadirAddActivity(
          submitCallback: _submitCallback,
          activityName: activityName,
          noOfDays: noOfDays,
          date: date,
          sessionPerDay: sessionPerDay,
          startTime: startTime,
          endTime: endTime,
          startTime1: startTime1,
          endTime1: endTime1,
          startTime2: startTime2,
          endTime2: endTime2,
          startTime3: startTime3,
          endTime3: endTime3,
          location: location,
          latitude: latitude,
          longitude: longitude,
          agenda: agenda,
          datePicker: _pickDate,
          endTimePicker: _endTimePicker,
          startTimePicker: _startTimePicker,
          addSession: _addSession,
          removeSession: _removeSession,
          title: widget.activityId == null
              ? AppLocalizations.of(context)!.newActivity
              : AppLocalizations.of(context)!.editActivity,
        ),
        bottomNavigationBar: const BottomNavController(),
      ),
    );
  }

  _submitActivityCallback(http.Response response) {
    if (response.statusCode == 200) {
      NewActivityRes res = NewActivityRes.fromJson(
        jsonDecode(response.body),
      );
      if (res.kod == 0) {
        AlertController(ctx: context).generalError(
            capitalize(
              AppLocalizations.of(context)!.successfullySaved,
            ), () {
          Navigator.pop(context);
          Navigator.pop(context);
        });
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
  }

  void _submitCallback(BuildContext context) {
    if (widget.activityId != null) {
      _update();
    } else {
      _create();
    }
  }

  _checkendDate() {
    DateTime startDate = DateTime.parse(selectedDate);
    endDate = DateFormat('yyyy-MM-dd').format(
      startDate.add(
        Duration(days: int.parse(noOfDays.text) - 1),
      ),
    );
  }

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate:
            selectedDate != '' ? DateTime.parse(selectedDate) : DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String tempDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      if (noOfDays.text != '') {
        endDate = DateFormat('yyyy-MM-dd').format(
          pickedDate.add(
            Duration(
              days: int.parse(
                    noOfDays.text,
                  ) -
                  1,
            ),
          ),
        );
      } else {
        endDate = selectedDate;
      }

      setState(() {
        date.text = tempDate;
      });
    } else {
      // print("Date is not selected");
    }
  }

  void _startTimePicker(int number) {
    TextEditingController controller = startTime;
    if (number == 2) {
      controller = startTime1;
    } else if (number == 3) {
      controller = startTime2;
    } else if (number == 4) {
      controller = startTime3;
    }
    _pickTime(controller);
  }

  void _endTimePicker(int number) {
    TextEditingController controller = endTime;
    if (number == 2) {
      controller = endTime1;
    } else if (number == 3) {
      controller = endTime2;
    } else if (number == 4) {
      controller = endTime3;
    }
    _pickTime(controller);
  }

  void _pickTime(TextEditingController timeController) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      String hour;
      String minute;
      if (pickedTime.hour < 10) {
        hour = ('0${pickedTime.hour}');
      } else {
        hour = pickedTime.hour.toString();
      }
      if (pickedTime.minute < 10) {
        minute = ('0${pickedTime.minute}');
      } else {
        minute = pickedTime.minute.toString();
      }
      String formattedDate = "$hour:$minute:00";

      setState(() {
        timeController.text = formattedDate;
      });
    } else {
      // print("Date is not selected");
    }
  }

  void _getActivity() {
    SiteConfig conf = SiteConfig();
    jpjHttpRequest(
      context,
      Uri.parse(conf.eHadirActivityById),
      headers: conf.formHeader,
      body: jsonEncode({
        'id': widget.activityId,
      }),
      callback: (res) {
        if (res.statusCode == 200) {
          ActivityListRes response =
              ActivityListRes.fromJson(jsonDecode(res.body));
          activityName.text = response.aktiviti![0].namaAktiviti ?? "";
          selectedDate = response.aktiviti![0].tarikhMula ?? "";
          date.text = dateDisplay(selectedDate);
          noOfDays.text = response.aktiviti![0].bilanganHari?.toString() ?? "";
          latitude.text = response.aktiviti![0].latitude?.toString() ?? "";
          longitude.text = response.aktiviti![0].longitude?.toString() ?? "";
          endDate = response.aktiviti![0].tarikhTamat ?? "";
          sessionPerDay.text =
              response.aktiviti![0].masaSesi!.length.toString();
          for (int i = 0; i < response.aktiviti![0].masaSesi!.length; i++) {
            String tempStartTime;
            String tempEndTime;
            tempStartTime =
                response.aktiviti![0].masaSesi![i].masaMula.toString();
            tempEndTime =
                response.aktiviti![0].masaSesi![i].masaTamat.toString();
            if (i == 0) {
              startTime.text = tempStartTime;
              endTime.text = tempEndTime;
            } else if (i == 1) {
              startTime1.text = tempStartTime;
              endTime1.text = tempEndTime;
            } else if (i == 2) {
              startTime2.text = tempStartTime;
              endTime2.text = tempEndTime;
            } else {
              startTime3.text = tempStartTime;
              endTime3.text = tempEndTime;
            }
          }
          location.text = response.aktiviti![0].lokasi ?? "";
          latitude.text = response.aktiviti![0].latitude ?? "";
          longitude.text = response.aktiviti![0].longitude ?? "";
          agenda.text = response.aktiviti![0].keterangan ?? "";
          setState(() {});
        } else {
          AlertController(ctx: context).generalError(
            AppLocalizations.of(context)!.errorPleaseTryAgain,
            () {
              Navigator.pop(context);
            },
          );
        }
      },
    );
  }

  _update() async {
    if (activityName.text.isNotEmpty &&
        noOfDays.text.isNotEmpty &&
        date.text.isNotEmpty &&
        sessionPerDay.text.isNotEmpty &&
        startTime.text.isNotEmpty &&
        endTime.text.isNotEmpty &&
        agenda.text.isNotEmpty) {
      if (_checkSessions()) {
        _checkendDate();
        SiteConfig conf = SiteConfig();
        EditActivityReq req = EditActivityReq(
          nokp: MyJPJAccountManager().id,
          bilanganHari: noOfDays.text,
          lokasi: location.text,
          keterangan: agenda.text,
          nama: activityName.text,
          bilanganSesi: sessionPerDay.text,
          tarikhMula: selectedDate,
          tarikhTamat: endDate,
          latitude: latitude.text,
          longitude: longitude.text,
          idAktiviti: widget.activityId,
          sesi: _getSessionData(),
        );

        Map<String, dynamic> map = {};
        map["nokp"] = MyJPJAccountManager().id;
        map["bilangan_hari"] = noOfDays.text;
        map["lokasi"] = location.text;
        map["keterangan"] = agenda.text;
        map["nama"] = activityName.text;
        map["bilangan_sesi"] = sessionPerDay.text;
        map["tarikh_mula"] = selectedDate;
        map["tarikh_tamat"] = endDate;
        map["latitude"] = latitude.text;
        map["longitude"] = longitude.text;
        map["id_aktiviti"] = widget.activityId.toString();
        map["sesi[0][masa_mula]"] = startTime.text;
        map["sesi[0][masa_tamat]"] = endTime.text;

        if (startTime1.text != '' && endTime1.text != '') {
          map["sesi[1][masa_mula]"] = startTime1.text;
          map["sesi[1][masa_tamat]"] = endTime1.text;
        }

        if (startTime2.text != '' && endTime2.text != '') {
          map["sesi[2][masa_mula]"] = startTime2.text;
          map["sesi[2][masa_tamat]"] = endTime2.text;
        }

        if (startTime3.text != '' && endTime3.text != '') {
          map["sesi[3][masa_mula]"] = startTime3.text;
          map["sesi[3][masa_tamat]"] = endTime3.text;
        }

        return jpjHttpRequest(
          context,
          Uri.parse(conf.eHadirUpdateActivity),
          body: map,
          callback: _submitActivityCallback,
        );
      } else {
        AlertController(ctx: context).generalError(
          AppLocalizations.of(context)!.invalidTime,
          () {
            Navigator.pop(context);
          },
        );
      }
    } else {
      AlertController(ctx: context).generalSpanError(
        AppLocalizations.of(context)!.pleaseFillInRequired,
        ' *',
        () {
          Navigator.pop(context);
        },
        textStyle2: const TextStyle(
          color: Colors.red,
        ),
      );
    }
  }

  List<Sesi> _getSessionData() {
    List<Sesi> sessions = [];
    sessions.add(Sesi(
      masaMula: startTime.text,
      masaTamat: endTime.text,
    ));

    if (startTime1.text != '' && endTime1.text != '') {
      sessions.add(Sesi(
        masaMula: startTime1.text,
        masaTamat: endTime1.text,
      ));
    }

    if (startTime2.text != '' && endTime2.text != '') {
      sessions.add(Sesi(
        masaMula: startTime2.text,
        masaTamat: endTime2.text,
      ));
    }

    if (startTime3.text != '' && endTime3.text != '') {
      sessions.add(Sesi(
        masaMula: startTime3.text,
        masaTamat: endTime3.text,
      ));
    }

    return sessions;
  }

  _checkSessions() {
    var retval1 = false;
    var retval2 = true;
    var retval3 = true;
    var retval4 = true;
    if (startTime.text != '' && endTime.text != '') {
      if (_validateTime(startTime.text, endTime.text)) {
        retval1 = true;
      } else {
        retval1 = false;
      }
    }

    if (startTime1.text != '' && endTime1.text != '') {
      if (_validateTime(startTime1.text, endTime1.text)) {
        retval2 = true;
      } else {
        retval2 = false;
      }
    }

    if (startTime2.text != '' && endTime2.text != '') {
      if (_validateTime(startTime2.text, endTime2.text)) {
        retval3 = true;
      } else {
        retval3 = false;
      }
    }

    if (startTime3.text != '' && endTime3.text != '') {
      if (_validateTime(startTime3.text, endTime3.text)) {
        retval4 = true;
      } else {
        retval4 = false;
      }
    }

    return retval1 && retval2 && retval3 && retval4;
  }

  _validateTime(String start, String end) {
    var rawStart = start.split(':');
    var rawEnd = end.split(':');
    var sessionStartTime = TimeOfDay(
      hour: int.parse(rawStart[0]),
      minute: int.parse(rawStart[1]),
    );
    var sessionEndTime = TimeOfDay(
      hour: int.parse(rawEnd![0]),
      minute: int.parse(rawEnd[1]),
    );
    var startDouble = toDouble(sessionStartTime);
    var endDouble = toDouble(sessionEndTime);

    return endDouble > startDouble;
  }

  _create() {
    if (activityName.text.isNotEmpty &&
        noOfDays.text.isNotEmpty &&
        date.text.isNotEmpty &&
        sessionPerDay.text.isNotEmpty &&
        startTime.text.isNotEmpty &&
        endTime.text.isNotEmpty &&
        agenda.text.isNotEmpty) {
      if (_checkSessions()) {
        _checkendDate();
        SiteConfig conf = SiteConfig();
        NewActivityReq req = NewActivityReq(
          nokp: MyJPJAccountManager().id,
          bilanganHari: noOfDays.text,
          lokasi: location.text,
          keterangan: agenda.text,
          nama: activityName.text,
          bilanganSesi: sessionPerDay.text,
          tarikhMula: selectedDate,
          tarikhTamat: endDate,
          latitude: latitude.text,
          longitude: longitude.text,
          masaMula1: startTime.text,
          masaTamat1: endTime.text,
          masaMula2: startTime1.text,
          masaTamat2: endTime1.text,
          masaMula3: startTime2.text,
          masaTamat3: endTime2.text,
          masaMula4: startTime3.text,
          masaTamat4: endTime3.text,
        );

        return jpjHttpRequest(
          context,
          Uri.parse(conf.eHadirNewActivity),
          headers: conf.formHeader,
          body: jsonEncode(req.toJson()),
          callback: _submitActivityCallback,
        );
      } else {
        AlertController(ctx: context).generalError(
          AppLocalizations.of(context)!.invalidTime,
          () {
            Navigator.pop(context);
          },
        );
      }
    } else {
      AlertController(ctx: context).generalSpanError(
        AppLocalizations.of(context)!.pleaseFillInRequired,
        '*',
        () {
          Navigator.pop(context);
        },
        textStyle2: const TextStyle(
          color: Colors.red,
        ),
      );
    }
  }

  _addSession() {
    setState(() {
      if (int.parse(sessionPerDay.text) > 1) {
        sessionPerDay.text = (int.parse(sessionPerDay.text) - 1).toString();
      }
    });
  }

  _removeSession() {
    setState(() {
      if (int.parse(sessionPerDay.text) <= 3) {
        sessionPerDay.text = (int.parse(sessionPerDay.text) + 1).toString();
      }
    });
  }

  dateDisplay(String rawDate) {
    List<String> tempVal = rawDate.split('-');

    return '${tempVal[2]}-${tempVal[1]}-${tempVal[0]}';
  }
}
