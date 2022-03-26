import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';
import 'package:jpj_info/controller/login_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  runApp(
    MaterialApp(
      home: const LoginController(),
      builder: EasyLoading.init(),
    ),
  );

  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.wave;
  EasyLoading.instance.dismissOnTap = false;
  EasyLoading.instance.maskType = EasyLoadingMaskType.black;
  EasyLoading.instance.maskColor = Colors.blue.withOpacity(0.5);
}
