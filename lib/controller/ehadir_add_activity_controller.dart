import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/eHadirAddActivity/ehadir_add_activity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EhadirAddActivityController extends StatefulWidget {
  const EhadirAddActivityController({
    Key? key,
  }) : super(key: key);

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
    startTime = TextEditingController();
    endTime = TextEditingController();
    location = TextEditingController();
    latitude = TextEditingController();
    longitude = TextEditingController();
    agenda = TextEditingController();
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
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: EhadirAddActivity(
          submitCallback: _submitCallback,
          activityName: activityName,
          noOfDays: noOfDays,
          date: date,
          sessionPerDay: sessionPerDay,
          startTime: startTime,
          endTime: endTime,
          location: location,
          latitude: latitude,
          longitude: longitude,
          agenda: agenda,
          datePicker: _pickDate,
          endTimePicker: _endTimePicker,
          startTimePicker: _startTimePicker,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _submitCallback(BuildContext context) {
    // todo: add processing of input to update activity list
    AlertController(ctx: context)
        .generalError(AppLocalizations.of(context)!.successfullySaved, () {
      Navigator.pop(context);
      Navigator.pop(context);
    });
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

  void _startTimePicker() {
    _pickTime(startTime);
  }

  void _endTimePicker() {
    _pickTime(endTime);
  }

  void _pickTime(TextEditingController timeController) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );

    if (pickedTime != null) {
      String formattedDate = pickedTime.format(context);

      setState(() {
        timeController.text = formattedDate;
      });
    } else {
      // print("Date is not selected");
    }
  }
}
