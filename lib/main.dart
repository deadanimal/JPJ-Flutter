import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/controller/landing_controller.dart';
import 'package:jpj_info/controller/one_signal_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/jpjeq/services/background_service.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == 'eqCheckNumberRefresh') {
      await BackgroundService().startCheck();
    }
    return Future.value(true);
  });
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  Workmanager().initialize(
    callbackDispatcher,
    // isInDebugMode: true,
  );

  OneSignalController().init();

  final prefs = await SharedPreferences.getInstance();
  prefs.reload();
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
      navigatorKey: navigatorKey,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const LandingPageController(),
      builder: EasyLoading.init(),
    );
  }
}
