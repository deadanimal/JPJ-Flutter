import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatusCardView extends StatelessWidget {
  const StatusCardView({
    Key? key,
    required this.width,
    required this.trailing,
    required this.leading,
    this.complaintId,
    required this.time,
    required this.date,
    required this.offense,
  }) : super(key: key);
  final double width;
  final Widget leading;
  final Widget trailing;
  final String? complaintId;
  final String time;
  final String date;
  final String offense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(verticalPadding),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            complaintId != null
                ? Column(
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.complaintId}:",
                        style: const TextStyle(
                          color: Color(themeNavy),
                          fontSize: 10,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: vPaddingS),
                      Text(
                        complaintId!,
                        style: const TextStyle(
                          color: Color(0xff2e2e2e),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: vPaddingM),
                    ],
                  )
                : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${AppLocalizations.of(context)!.date}:",
                      style: const TextStyle(
                        color: Color(themeNavy),
                        fontSize: 10,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: vPaddingS),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Color(0xff2e2e2e),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${AppLocalizations.of(context)!.time}:",
                      style: const TextStyle(
                        color: Color(themeNavy),
                        fontSize: 10,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: vPaddingS),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Color(0xff2e2e2e),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: vPaddingM),
            Text(
              "${AppLocalizations.of(context)!.offense}:",
              style: const TextStyle(
                color: Color(themeNavy),
                fontSize: 10,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: vPaddingS),
            Text(
              offense,
              style: const TextStyle(
                color: Color(0xff2e2e2e),
                fontSize: 13,
              ),
            ),
            const SizedBox(height: vPaddingM),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leading,
                trailing,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
