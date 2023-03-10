import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';

class JpjEqTransaction extends StatelessWidget {
  const JpjEqTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _title(context),
          _transactionList(context),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          width: mediaWidth,
          child: Text(
            AppLocalizations.of(context)!.transaction,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(eqThemeNavy),
              fontSize: 20,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }

  Widget _transactionList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _transactionInfo(
            context,
          );
        },
      ),
    );
  }

  Widget _transactionInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundedCornerContainer(
        width: mediaWidth - 32,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Color(eqThemeOrange),
              ),
              width: mediaWidth,
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "30 Januari 2023",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  _transactionInfoText(
                    AppLocalizations.of(context)!.branch,
                    'trx.branch',
                  ),
                  const SizedBox(height: 24),
                  _transactionInfoText(
                    AppLocalizations.of(context)!.registerTime,
                    'trx.registerTime',
                  ),
                  const SizedBox(height: 24),
                  _transactionInfoText(
                    AppLocalizations.of(context)!.queueNumber,
                    'trx.queueNumber',
                  ),
                  const SizedBox(height: 24),
                  _transactionInfoText(
                    AppLocalizations.of(context)!.queueCounter,
                    'trx.queueCounter',
                  ),
                  const SizedBox(height: 24),
                  _transactionInfoText(
                    AppLocalizations.of(context)!.status,
                    'trx.status',
                    isStatus: true,
                  ),
                  const SizedBox(height: 24),
                  _transactionInfoText(
                    AppLocalizations.of(context)!.callTime,
                    'trx.callTime',
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statusText(rawString) {
    // todo: change based on status
    Color background = Colors.green;
    Color textColor = Colors.white;

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: background,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              rawString,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _transactionInfoText(String label, String? info,
      {bool isStatus = false}) {
    if (info != null) {
      return Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 6,
            child: isStatus
                ? _statusText(info)
                : Text(
                    info,
                    style: const TextStyle(
                      fontFamily: "Roboto",
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
}
