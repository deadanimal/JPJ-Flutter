import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/string_helper.dart';
import 'package:jpj_info/model/ehadir/activity_by_id_res.dart';
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

  void _pickDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

      setState(() {
        date.text = formattedDate;
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
      String formattedDate = "${pickedTime.hour}:${pickedTime.minute}:00";

      setState(() {
        timeController.text = formattedDate;
      });
    } else {
      // print("Date is not selected");
    }
  }

  void _getActivity() {
    SiteConfig conf = SiteConfig();
    jpjHttpGetRequest(
      context,
      Uri.parse(conf.eHadirActivityById + widget.activityId.toString()),
      headers: conf.formHeader,
      callback: (res) {
        if (res.statusCode == 200) {
          ActivityByIdRes response =
              ActivityByIdRes.fromJson(jsonDecode(res.body));
          activityName.text = response.namaAktiviti ?? "";
          noOfDays.text = response.bilanganHari!.toString();
          date.text = response.tarikhMula ?? "";
          sessionPerDay.text = response.bilanganSesi!.toString();
          startTime.text = response.masaMula ?? "";
          endTime.text = response.masaTamat ?? "";
          location.text = response.lokasi ?? "";
          latitude.text = response.latitude ?? "";
          longitude.text = response.longitude ?? "";
          agenda.text = response.keterangan ?? "";
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

  _update() {
    if (activityName.text.isNotEmpty &&
        noOfDays.text.isNotEmpty &&
        date.text.isNotEmpty &&
        sessionPerDay.text.isNotEmpty &&
        startTime.text.isNotEmpty &&
        endTime.text.isNotEmpty &&
        location.text.isNotEmpty &&
        latitude.text.isNotEmpty &&
        longitude.text.isNotEmpty &&
        agenda.text.isNotEmpty) {
      SiteConfig conf = SiteConfig();
      NewActivityReq req = NewActivityReq(
        nokp: MyJPJAccountManager().id,
        bilanganHari: noOfDays.text,
        lokasi: location.text,
        keterangan: agenda.text,
        nama: activityName.text,
        bilanganSesi: sessionPerDay.text,
        tarikhMula: date.text,
        latitude: latitude.text,
        longitude: longitude.text,
        masaMula: startTime.text,
        masaTamat: endTime.text,
        masaMula1: startTime1.text,
        masaTamat1: endTime1.text,
        masaMula2: startTime2.text,
        masaTamat2: endTime2.text,
        masaMula3: startTime3.text,
        masaTamat3: endTime3.text,
        idAktiviti: widget.activityId,
      );

      return jpjHttpRequest(
        context,
        Uri.parse(conf.eHadirUpdateActivity),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
        callback: _submitActivityCallback,
      );
    } else {}
  }

  _create() {
    if (activityName.text.isNotEmpty &&
        noOfDays.text.isNotEmpty &&
        date.text.isNotEmpty &&
        sessionPerDay.text.isNotEmpty &&
        startTime.text.isNotEmpty &&
        endTime.text.isNotEmpty &&
        agenda.text.isNotEmpty) {
      SiteConfig conf = SiteConfig();
      NewActivityReq req = NewActivityReq(
        nokp: MyJPJAccountManager().id,
        bilanganHari: noOfDays.text,
        lokasi: location.text,
        keterangan: agenda.text,
        nama: activityName.text,
        bilanganSesi: sessionPerDay.text,
        tarikhMula: date.text,
        latitude: latitude.text,
        longitude: longitude.text,
        masaMula: startTime.text,
        masaTamat: endTime.text,
        masaMula1: startTime1.text,
        masaTamat1: endTime1.text,
        masaMula2: startTime2.text,
        masaTamat2: endTime2.text,
        masaMula3: startTime3.text,
        masaTamat3: endTime3.text,
      );

      return jpjHttpRequest(
        context,
        Uri.parse(conf.eHadirNewActivity),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
        callback: _submitActivityCallback,
      );
    } else {}
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
}
