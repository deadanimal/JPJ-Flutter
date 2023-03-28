import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-number-called/jpjeq_number_call_controller.dart';
import 'package:jpj_info/main.dart';

class OneSignalController {
  init() async {
    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId(SiteConfig().oneSignalAppId);

    // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      debug("Accepted permission: $accepted");
    });

    /// Get the Onesignal userId and update that into the firebase.
    /// So, that it can be used to send Notifications to users later.̥
    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;
    // We will update this once he logged in and goes to dashboard.
    ////updateUserProfile(osUserID);
    // Store it into shared prefs, So that later we can use it.
    SharedPreferences.getInstance().then(
      (value) {
        value.setString(
          LocalStorageHelper().jpjOneSignalPlayerId,
          osUserID.toString(),
        );
      },
    );

    OneSignal.shared.setOnWillDisplayInAppMessageHandler(
      (message) {
        debug(message.jsonRepresentation());
      },
    );
    OneSignal.shared.setOnWillDismissInAppMessageHandler(
      (OSInAppMessage message) {
        debug(message.jsonRepresentation());
      },
    );

    OneSignal.shared.setInAppMessageClickedHandler(
      (OSInAppMessageAction action) {},
    );
    OneSignal.shared.setNotificationOpenedHandler(
      (OSNotificationOpenedResult result) {
        showNotification(result.notification);
      },
    );

    OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
        // Will be called whenever a notification is received in foreground
        // Display Notification, pass null param for not displaying the notification
        showNotification(event.notification);
        event.complete(event.notification);
      },
    );
  }

  debug(String message) {
    debugPrint("Amir's Log $message");
  }

  showNotification(OSNotification notification) {
    // Nombor 3295. Sila ke kaunter 22
    String notificationText = notification.body!.toUpperCase();
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
}
