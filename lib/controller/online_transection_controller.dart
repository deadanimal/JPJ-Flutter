import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/serviceList/service_list.dart';

class OnlineTransectionController extends StatefulWidget {
  const OnlineTransectionController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnlineTransectionController();
}

class _OnlineTransectionController extends State<OnlineTransectionController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AppBarController(
          decor: customGradient,
        ),
        body: ServiceList(),
      ),
    );
  }
}
