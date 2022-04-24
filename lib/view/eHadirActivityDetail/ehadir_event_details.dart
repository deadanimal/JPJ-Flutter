import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/ehadir_event_info.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/summonsVerification/component/bordered_container.dart';

class EhadirActivityDetails extends StatelessWidget {
  const EhadirActivityDetails({
    Key? key,
    required this.event,
  }) : super(key: key);
  final EHadirEventInfo event;

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
    return Center(
      child: Container(
        width: mediaWidth,
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          children: [
            const Image(
              image: AssetImage("images/ehadir_man_and_clock.png"),
            ),
            CustomBorderedContainer(
              width: mediaWidth - 64,
              child: Column(
                children: [
                  Text(
                    event.eventName!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 35,
                      color: Color(themeNavy),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: vPaddingM),
                  Text(
                    event.venue! +
                        "\n" +
                        event.date! +
                        "\n" +
                        event.startTime! +
                        " - " +
                        event.endTime!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
