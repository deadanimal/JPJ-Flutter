import 'package:flutter/material.dart';
import 'package:jpj_info/model/jpj_eq_transaction.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';

class JpjEqTransactions extends StatelessWidget {
  const JpjEqTransactions({
    Key? key,
    required this.backCB,
    required this.transactions,
  }) : super(key: key);

  final Function(BuildContext) backCB;
  final List<JpjEqTransaction> transactions;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: mediaWidth - 64,
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.previousTransaction,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(themeNavy),
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.63,
                ),
              ),
              const SizedBox(height: vPaddingXL),
              _transactions(context),
              const SizedBox(height: vPaddingXL),
              CustomButton(
                width: 210,
                onPressed: () {
                  backCB(context);
                },
                decoration: navyGradientBtnDecoSquare,
                label: AppLocalizations.of(context)!.back,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _transactions(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: transactions.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _transactionInfoCard(
          context,
          transactions[index],
        );
      },
    );
  }

  Widget _transactionInfoCard(
    BuildContext context,
    JpjEqTransaction transaction,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: RoundedCornerContainer(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(headerGradient1), Color(headerGradient2)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    transaction.date!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.63,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: vPaddingM),
              _transactionInfoText(
                AppLocalizations.of(context)!.branch,
                transaction.branch,
              ),
              const SizedBox(height: vPaddingM),
              _transactionInfoText(
                AppLocalizations.of(context)!.registerTime,
                transaction.registrationTime,
              ),
              const SizedBox(height: vPaddingM),
              _transactionInfoText(
                AppLocalizations.of(context)!.queueNumber,
                transaction.number,
              ),
              const SizedBox(height: vPaddingM),
              _transactionInfoStatus(
                AppLocalizations.of(context)!.status,
                transaction.status!.toUpperCase(),
              ),
              const SizedBox(height: vPaddingM),
              _transactionInfoText(
                AppLocalizations.of(context)!.cancelTime,
                transaction.canceledTime,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _transactionInfoText(String label, String? info) {
    if (info != null) {
      return Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(themeNavy),
                fontSize: 12,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 6,
            child: Text(
              info,
              style: const TextStyle(
                color: Color(themeNavy),
                fontFamily: "Poppins",
                fontSize: 12,
              ),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget _transactionInfoStatus(String label, String info) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Color(themeNavy),
              fontSize: 12,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 6,
          child: Text(
            info,
            style: TextStyle(
              color: info == "BATAL" ? Colors.red : Colors.green,
              fontSize: 12,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
