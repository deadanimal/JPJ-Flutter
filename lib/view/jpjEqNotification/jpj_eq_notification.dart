import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JpjEqNotification extends StatelessWidget {
  const JpjEqNotification({
    Key? key,
    required this.notifications,
    required this.openNotificationDetailsFx,
  }) : super(key: key);

  final List<String> notifications;
  final Function(BuildContext) openNotificationDetailsFx;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/main_bg.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            width: mediaWidth - 64,
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                _title(context),
                const SizedBox(height: vPaddingXL),
                _notifications(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.notification,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color(0xff171f44),
        fontSize: 18,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
        letterSpacing: 0.63,
      ),
    );
  }

  Widget _notifications() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: notifications.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: InkWell(
            onTap: () => openNotificationDetailsFx(context),
            child: RoundedCornerContainer(
              color: const Color(themeNavy),
              cornerRadius: 8.0,
              width: double.infinity,
              child: Row(
                children: [
                  const Spacer(flex: 1),
                  Expanded(
                    flex: 19,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "21 Feb 2022 | 12:08:48 PM",
                              style: TextStyle(
                                color: Color(0xff707070),
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              notifications[index],
                              style: const TextStyle(
                                color: Color(0xffd06400),
                                fontSize: 15,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
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
          ),
        );
      },
    );
  }
}
