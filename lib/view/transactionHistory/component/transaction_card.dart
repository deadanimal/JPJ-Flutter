import 'package:flutter/material.dart';
import 'package:jpj_info/model/transaction_history_data.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTransactionCard extends StatelessWidget {
  const CustomTransactionCard({
    Key? key,
    required this.transactionData,
  }) : super(key: key);
  final TransactionHistoryData transactionData;

  @override
  Widget build(BuildContext context) {
    return _transactionList(context);
  }

  Widget _transactionList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        padding:
            const EdgeInsets.fromLTRB(vPaddingXL, vPaddingXL, vPaddingXL, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              transactionData.transaction!.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff171f44),
                fontSize: 16,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: vPaddingM),
            Text(
              AppLocalizations.of(context)!.transactionDate,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff171f44),
                fontSize: 10,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: vPaddingS),
            Text(
              transactionData.date!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff2e2e2e),
                fontSize: 13,
                fontFamily: "Poppins",
              ),
            ),
            const SizedBox(height: vPaddingM),
            _priceIfAny(transactionData.price),
            const SizedBox(height: vPaddingM),
            _documentIfAny(context),
          ],
        ),
      ),
    );
  }

  Widget _priceIfAny(String? price) {
    if (price != null && price != "") {
      return Text(
        "RM$price",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w900,
          foreground: Paint()
            ..shader = const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff4cac1e),
                Color(0xff436f0b),
              ],
            ).createShader(
              const Rect.fromLTWH(0.0, 0.0, 50.0, 30.0),
            ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _documentIfAny(BuildContext context) {
    if (transactionData.hasDoc!) {
      return Padding(
        padding: const EdgeInsets.only(bottom: vPaddingM),
        child: CustomButton(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color(btnShadow),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            color: const Color(btnColor),
          ),
          label: _buttonLabel(context),
          width: double.infinity,
          onPressed: () => _launchURL(transactionData.docLink!),
        ),
      );
    } else {
      return const SizedBox(height: vPaddingXL);
    }
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri(host: url))) {
      _launchURL(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String _buttonLabel(BuildContext context) {
    if (transactionData.docType == "receipt") {
      return AppLocalizations.of(context)!.showReceipt;
    } else {
      return AppLocalizations.of(context)!.showDocument;
    }
  }
}
