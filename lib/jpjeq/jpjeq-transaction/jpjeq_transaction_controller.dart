import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/jpjeq-transaction/jpjeq_transaction.dart';

class JpjEqTransactionController extends StatefulWidget {
  const JpjEqTransactionController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqTransactionController();
}

class _JpjEqTransactionController extends State<JpjEqTransactionController> {
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
        body: JpjEqTransaction(),
        bottomNavigationBar: JpjEqBottomNavController(pageNumber: 3),
      ),
    );
  }
}
