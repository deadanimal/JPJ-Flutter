import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/model/transaction_history_data.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:jpj_info/view/transactionHistory/component/transaction_card.dart';

class TransactionHistory extends StatelessWidget {
  const TransactionHistory({
    Key? key,
    required this.pageTitle,
    required this.refreshCallback,
    required this.transactionList,
  }) : super(key: key);

  final String pageTitle;
  final Function refreshCallback;
  final List<TransactionHistoryData> transactionList;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return _showPageContent();
  }

  Widget _showPageContent() {
    return Column(
      children: [
        TemplateHeader(
          headerTitle: pageTitle,
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.only(top: vPaddingM),
            width: mediaWidth - 64,
            constraints: const BoxConstraints(maxWidth: 400),
            child: _transactionList(),
          ),
        ),
      ],
    );
  }

  Widget _transactionList() {
    return RefreshIndicator(
      onRefresh: () => refreshCallback(),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: transactionList.length,
        itemBuilder: (context, index) {
          return CustomTransactionCard(
            transactionData: transactionList[index],
          );
        },
      ),
    );
  }
}
