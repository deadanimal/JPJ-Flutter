import 'package:flutter/material.dart';
import 'package:jpj_info/model/ehadir_event_info.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/summonsVerification/component/bordered_container.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({
    Key? key,
    required this.event,
  }) : super(key: key);
  final EHadirEventInfo event;

  @override
  Widget build(BuildContext context) {
    return CustomBorderedContainer(
      width: mediaWidth,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              event.eventName!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(btnColor),
                fontSize: 35,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: vPaddingXL),
            QrImage(
              data: "1234567890",
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: vPaddingXL),
            Text(
              "${event.venue!}\n${event.date!}\nSESI 1 ${event.startTime!} - ${event.endTime!}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
