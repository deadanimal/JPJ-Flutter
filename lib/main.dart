import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';
import 'package:jpj_info/controller/login_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
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
    locale = const Locale("ms");
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(themeNavy),
      ),
    );
    return MaterialApp(
      locale: Locale(MyJPJAccountManager().preferredLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const SafeArea(
        child: LoginController(),
      ),
      builder: EasyLoading.init(),
    );
  }
}
