import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/jpj_eq_transaction.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/jpjEqTransactions/jpj_eq_transactions.dart';

class JpjEqTransactionController extends StatefulWidget {
  const JpjEqTransactionController({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqTransactionController();
}

class _JpjEqTransactionController extends State<JpjEqTransactionController> {
  //todo: update transactions details from server
  List<JpjEqTransaction> transactions = [
    JpjEqTransaction(
      branch: "JPJ Cawangan Jempol(Bawah)",
      registrationTime: "16:20:38",
      date: "6 April 2022",
      number: "2800",
      status: "Baru",
    ),
    JpjEqTransaction(
        branch: "JPJ Cawangan Jempol(Bawah)",
        registrationTime: "14:11:28",
        date: "6 April 2022",
        number: "2500",
        status: "BATAL",
        canceledTime: "16:16:40"),
    JpjEqTransaction(
      branch: "JPJ Cawangan Jempol(Bawah)",
      registrationTime: "11:15:28",
      date: "21 Mac 2022",
      number: "1123",
      status: "Batal",
      canceledTime: "14:10:20",
    ),
  ];
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
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: JpjEqTransactions(
          backCB: _backCallback,
          transactions: transactions,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _backCallback(BuildContext context) {
    Navigator.of(context).pop();
  }
}
