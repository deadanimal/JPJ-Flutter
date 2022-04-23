import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/summonsVerification/component/bordered_container.dart';

class EhadirConfirmAttendance extends StatelessWidget {
  const EhadirConfirmAttendance({
    Key? key,
    required this.eventName,
    required this.vanue,
    required this.date,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);
  final String eventName;
  final String vanue;
  final String date;
  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: _body(context),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: mediaHeight,
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          children: [
            const Image(
              image: AssetImage("images/ehadir_attending_activity_figure.png"),
            ),
            Text(
              AppLocalizations.of(context)!.thankYou,
              style: const TextStyle(
                color: Color(0xff354c96),
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: vPaddingM),
            Text(
              AppLocalizations.of(context)!.youHaveAttandedThisActivity,
              style: const TextStyle(
                color: Color(0xff354c96),
                fontSize: 15,
                fontFamily: "Poppins",
              ),
            ),
            const SizedBox(height: vPaddingM),
            CustomBorderedContainer(
              child: Column(
                children: [
                  Text(
                    eventName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(themeNavy),
                      fontSize: 35,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: vPaddingM),
                  Text(
                    vanue + "\n" + date + "\n" + startTime + " - " + endTime,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              width: mediaWidth - 64,
            ),
            const SizedBox(height: vPaddingM),
          ],
        ),
      ),
    );
  }
}
