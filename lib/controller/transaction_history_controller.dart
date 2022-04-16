import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/transaction_history_data.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/transactionHistory/transaction_history.dart';

class TransactionHistoryController extends StatefulWidget {
  const TransactionHistoryController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransactionHistoryController();
}

class _TransactionHistoryController
    extends State<TransactionHistoryController> {
  List<TransactionHistoryData> msgList = [];
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
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: FutureBuilder<List<TransactionHistoryData>>(
          future: _getMessagesList(),
          builder: (BuildContext context,
              AsyncSnapshot<List<TransactionHistoryData>> snapshot) {
            if (!snapshot.hasData) {
              EasyLoading.show(
                status: AppLocalizations.of(context)!.pleaseWait,
              );
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              EasyLoading.dismiss();
              return TransactionHistory(
                pageTitle: AppLocalizations.of(context)!.transactionHistory,
                refreshCallback: _refreshMsgList,
                transactionList: msgList,
              );
            }
          },
        ),
        bottomNavigationBar: BottomNavController(
          darkTheme: true,
        ),
      ),
    );
  }

  Future<List<TransactionHistoryData>> _getMessagesList() async {
    if (msgList.isEmpty) {
      final String response =
          await rootBundle.loadString('json/transaction_history.json');
      final data = await json.decode(response);
      data.forEach(
        (element) {
          TransactionHistoryData b = TransactionHistoryData.fromJson(element);
          msgList.add(b);
        },
      );
    }
    return msgList;
  }

  void _refreshMsgList() async {
    final String response =
        await rootBundle.loadString('json/transaction_history.json');
    final data = await json.decode(response);
    setState(() {
      msgList.clear();
      data.forEach(
        (element) {
          TransactionHistoryData b = TransactionHistoryData.fromJson(element);
          msgList.add(b);
        },
      );
    });
  }
}
