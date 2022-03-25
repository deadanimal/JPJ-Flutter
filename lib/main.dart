import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';
import 'package:jpj_info/view/login/login.dart';
import 'package:jpj_info/view/mainpage/mainpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  runApp(
    MaterialApp(home: Login()),
  );

  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.wave;
  EasyLoading.instance.dismissOnTap = false;
  EasyLoading.instance.maskType = EasyLoadingMaskType.black;
  EasyLoading.instance.maskColor = Colors.blue.withOpacity(0.5);
}

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const MainPage();
    return const Login();
  }
}
