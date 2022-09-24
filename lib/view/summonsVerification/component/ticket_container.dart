import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTicketContainer extends StatelessWidget {
  const CustomTicketContainer({
    Key? key,
    required this.vehicleNo,
    required this.amount,
    required this.details,
    required this.date,
    required this.time,
    required this.ticketNo,
  }) : super(key: key);
  final String vehicleNo;
  final String amount;
  final String details;
  final String date;
  final String time;
  final String ticketNo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              vehicleNo,
              style: const TextStyle(
                color: Color(0xff354c96),
                fontSize: 30,
              ),
            ),
            Column(
              children: [
                Text(
                  "RM$amount",
                  style: const TextStyle(
                    color: Color(0xffe42222),
                    fontSize: 24,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.unpaidAmount,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xffe42222),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: vPaddingM),
        _detailsField(
          context,
          "${AppLocalizations.of(context)!.detail}:",
          details,
        ),
        const SizedBox(height: vPaddingM),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _detailsField(
              context,
              "${AppLocalizations.of(context)!.date}:",
              date,
            ),
            _detailsField(
              context,
              "${AppLocalizations.of(context)!.time}:",
              time,
            ),
          ],
        ),
        const SizedBox(height: vPaddingM),
        _detailsField(
          context,
          "${AppLocalizations.of(context)!.ticketNo}:",
          ticketNo,
        ),
      ],
    );
  }

  Widget _detailsField(BuildContext context, String title, String detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xff2e2e2e),
            fontSize: 10,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          detail,
          style: const TextStyle(
            color: Color(0xff2e2e2e),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
