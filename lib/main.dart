import 'package:flutter/material.dart';
import 'package:jpj_info/view/login/login.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
    ),
  );
  runApp(
    const MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(child: StartApp()),
        ),
      ),
    ),
  );
}

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
