import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_notification_history.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';

class JpjEqNotification extends StatelessWidget {
  const JpjEqNotification({
    Key? key,
    required this.notificationList,
  }) : super(key: key);
  final List<String> notificationList;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _title(context),
          _info(context),
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
            AppLocalizations.of(context)!.notification,
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

  Widget _info(BuildContext context) {
    return Expanded(
      child: Container(
        width: mediaWidth - 16,
        constraints: const BoxConstraints(maxWidth: 400),
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: notificationList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            NotificationHistoryModel item = NotificationHistoryModel.fromJson(
              jsonDecode(
                notificationList[notificationList.length - index - 1],
              ),
            );
            DateTime dateTime =
                DateTime.fromMillisecondsSinceEpoch(item.timestamp ?? 0);
            String timestamp =
                DateFormat('dd-MM-yyyy kk:mm a').format(dateTime);
            return _notificationCart(
              context,
              item.notification ?? "",
              timestamp,
            );
          },
        ),
      ),
    );
  }

  Widget _notificationCart(
    BuildContext context,
    String notification,
    String dateTime,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: RoundedCornerContainer(
        cornerRadius: 4,
        color: const Color(eqThemeOrange),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dateTime,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notification,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
