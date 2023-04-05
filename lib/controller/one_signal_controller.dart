import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_notification_history.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-number-called/jpjeq_number_call_controller.dart';
import 'package:jpj_info/main.dart';

class OneSignalController {
  init() async {
    //Remove this method to stop OneSignal Debugging
    // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId(SiteConfig().oneSignalAppId);

    // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      debug("Accepted permission: $accepted");
    });

    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;

    // Store it into shared prefs, So that later we can use it.
    SharedPreferences.getInstance().then(
      (value) {
        print("Save one signal id");
        value.setString(
          LocalStorageHelper().jpjOneSignalPlayerId,
          osUserID.toString(),
        );
      },
    );

    // for In-App message
    // OneSignal.shared.setOnWillDisplayInAppMessageHandler(
    //   (message) {
    //     debug(message.jsonRepresentation());
    //   },
    // );
    // OneSignal.shared.setOnWillDismissInAppMessageHandler(
    //   (OSInAppMessage message) {
    //     debug(message.jsonRepresentation());
    //   },
    // );

    // OneSignal.shared.setInAppMessageClickedHandler(
    //   (OSInAppMessageAction action) {},
    // );

    OneSignal.shared.setNotificationOpenedHandler(
      (OSNotificationOpenedResult result) {
        // save notification in shared prefs
        storeNotification(result.notification);
        showNotification(result.notification);
      },
    );

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
        // Will be called whenever a notification is received in foreground
        // Display Notification, pass null param for not displaying the notification

        // save notification in shared prefs
        event.complete(event.notification);
        storeNotification(event.notification);
        showNotification(event.notification);
      },
    );
  }

  debug(String message) {
    debugPrint("OneSignal Log $message");
  }

  // This method will show JpjEqNumberCallController
  showNotification(OSNotification notification) {
    // Nombor 3295. Sila ke kaunter 22
    String notificationText = notification.body ?? "";
    List<String> rawText = notificationText.split('.');

    int number = int.parse(rawText[0].replaceAll('Nombor ', ''));
    int counter = int.parse(rawText[1].replaceAll(' Sila ke kaunter ', ''));

    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => JpjEqNumberCallController(
          counter: counter,
          number: number,
        ),
      ),
    );
  }

  storeNotification(OSNotification notification) {
    // Store it into shared prefs, So that later we can use it.
    SharedPreferences.getInstance().then(
      (value) {
        List<String>? notificationList = value.getStringList(
          LocalStorageHelper().jpjeQNotificationHistory,
        );

        notificationList ??= [];
        List<NotificationHistoryModel> items = [];

        for (var el in notificationList) {
          items.add(
            NotificationHistoryModel.fromJson(
              jsonDecode(
                el,
              ),
            ),
          );
        }

        bool hasSaved = false;
        for (var el in items) {
          if (el.id == notification.notificationId) {
            hasSaved = true;
          }
        }

        if (!hasSaved) {
          items.add(
            NotificationHistoryModel(
              id: notification.notificationId,
              notification: notification.body ?? "",
              timestamp: DateTime.now().millisecondsSinceEpoch,
            ),
          );
        }

        List<String> tempList = [];

        for (var el in items) {
          tempList.add(jsonEncode(el.toJson()));
        }

        value.setStringList(
          LocalStorageHelper().jpjeQNotificationHistory,
          tempList,
        );
      },
    );
  }

  promnptForNotification() {
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      debug("Accepted permission: $accepted");
    });
  }
}
