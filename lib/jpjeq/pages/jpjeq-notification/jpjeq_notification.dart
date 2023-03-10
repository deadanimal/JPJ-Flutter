import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';

class JpjEqNotification extends StatelessWidget {
  const JpjEqNotification({Key? key}) : super(key: key);

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
          itemCount: 200,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _notificationCart(
              context,
            );
          },
        ),
      ),
    );
  }

  Widget _notificationCart(
    BuildContext context,
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
                    children: const [
                      Text(
                        "30 Jan 2023 05:25:06 PM",
                        style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "No anda 8001 telah dipanggil. Sila ke kaunter 8",
                        style: TextStyle(
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
