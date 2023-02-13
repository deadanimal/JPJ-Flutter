import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';
import 'package:jpj_info/controller/landing_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/jpjeq/jpjeq-homepage/jpjeq_homepage.dart';
import 'package:jpj_info/jpjeq/jpjeq-homepage/jpjeq_homepage_controller.dart';
import 'package:jpj_info/jpjeq/jpjeq-homepage/jpjeq_wrong_operating_hour.dart';
import 'package:jpj_info/jpjeq/jpjeq-notification/jpjeq_notification_controller.dart';
import 'package:jpj_info/jpjeq/jpjeq-transaction/jpjeq_transaction_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
// import 'package:jpj_info/helper/local_notification.dart';
// import 'package:jpj_info/model/inbox_request.dart';
// import 'package:workmanager/workmanager.dart';

// @pragma(
//     'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     print(task);
//     print(
//         "Hello there *************************************************************");
//     SiteConfig conf = SiteConfig();
//     InboxRequest req = InboxRequest(nokp: "940224095177");
//     jpjSilentHttpRequest(
//       Uri.parse(conf.unreadItem),
//       headers: conf.formHeader,
//       body: jsonEncode(req.toJson()),
//       callback: (b) {
//         print("Got the response");
//         print(b.statusCode);
//         print(b.body);
//       },
//     );

//     print("after response");
//     return Future.value(true);
//   });
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  // Workmanager().initialize(
  //   callbackDispatcher,
  //   isInDebugMode: true,
  // );
  // Workmanager().cancelAll();
  // Workmanager().registerPeriodicTask(
  //   "task2",
  //   "checkInbox",
  //   frequency: const Duration(minutes: 15),
  //   initialDelay: const Duration(seconds: 5),
  //   constraints: Constraints(networkType: NetworkType.connected),
  // );
  MyJPJAccountManager().init().then(
        (value) => runApp(
          MyJpj(),
        ),
      );

  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.wave;
  EasyLoading.instance.dismissOnTap = false;
  EasyLoading.instance.maskType = EasyLoadingMaskType.black;
  EasyLoading.instance.maskColor = Colors.blue.withOpacity(0.5);
}

class MyJpj extends StatefulWidget {
  late _MyJpjState? state;

  MyJpj({Key? key}) : super(key: key);
  @override
  _MyJpjState createState() => _MyJpjState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyJpjState? state = context.findRootAncestorStateOfType<_MyJpjState>();

    state!.setState(() {
      state.locale = newLocale;
    });
  }
}

class _MyJpjState extends State<MyJpj> {
  late Locale locale;

  @override
  void initState() {
    super.initState();
    locale = Locale(MyJPJAccountManager().preferredLanguage);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(themeNavy),
      ),
    );
    return MaterialApp(
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const JpjEqWrongOperatingHour(
        branchCode: "-",
        endTime: "16:10:00",
        startTime: "08:10:00",
      ),
      builder: EasyLoading.init(),
    );
  }
}
