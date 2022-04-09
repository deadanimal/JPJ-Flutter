import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/serviceList/service_list.dart';

class OnlineTransactionController extends StatefulWidget {
  const OnlineTransactionController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OnlineTransactionController();
}

class _OnlineTransactionController extends State<OnlineTransactionController> {
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
