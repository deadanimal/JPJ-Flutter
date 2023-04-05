import 'package:flutter/material.dart';
import 'package:jpj_info/model/ehadir/activity_list_res.dart';

getSession(Aktiviti currentActivity) {
  currentActivity.tarikhTamat ??= currentActivity.tarikhMula;
  String? sessionId;
  DateTime now = DateTime.now();
  DateTime startDate = DateTime.parse(currentActivity.tarikhMula ?? "");
  DateTime endDate = DateTime.parse(currentActivity.tarikhTamat ?? "");
  endDate = endDate.add(
    const Duration(
      days: 1,
    ),
  );
  if ((now.isBefore(endDate) && now.isAfter(startDate))) {
    var time = TimeOfDay.now();
    for (var el in currentActivity.masaSesi!) {
      var rawStart = el.masaMula?.split(':');
      var rawEnd = el.masaTamat?.split(':');
      var sessionStartTime = TimeOfDay(
        hour: int.parse(rawStart![0]),
        minute: int.parse(rawStart[1]),
      );
      var sessionEndTime = TimeOfDay(
        hour: int.parse(rawEnd![0]),
        minute: int.parse(rawEnd[1]),
      );

      var startTime = toDouble(sessionStartTime);
      var endTime = toDouble(sessionEndTime);
      var currentTime = toDouble(time);

      if (currentTime > startTime && currentTime < endTime) {
        sessionId = el.transidSesi;
      }
    }
  }

  return sessionId;
}

double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;
