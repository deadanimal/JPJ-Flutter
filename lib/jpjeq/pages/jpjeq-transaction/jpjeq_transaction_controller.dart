import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_history_model.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-transaction/jpjeq_transaction.dart';
import 'package:jpj_info/jpjeq/services/history_service.dart';

class JpjEqTransactionController extends StatefulWidget {
  const JpjEqTransactionController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqTransactionController();
}

class _JpjEqTransactionController extends State<JpjEqTransactionController> {
  List<JPJEqHistory> history = [];
  @override
  void initState() {
    super.initState();
    _getHistory();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getHistory() async {
    history = await JPJEqHistoryService.getHistory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: JpjEqTransaction(
          history: history,
        ),
        bottomNavigationBar: const JpjEqBottomNavController(pageNumber: 3),
      ),
    );
  }
}
