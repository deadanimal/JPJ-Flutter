import 'package:flutter/material.dart';
import 'package:jpj_info/helper/string_helper.dart';
import 'package:jpj_info/model/ehadir_event_info.dart';
import 'package:jpj_info/model/page_size.dart';
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
    return ListView(
      children: [
        CustomBorderedContainer(
          padding: const EdgeInsets.all(0),
          width: mediaWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [Color(0xff171f44), Color(0xff2b388d)],
                  ),
                ),
                child: Text(
                  capitalize(event.eventName!),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w700,
                  ),
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
                "${capitalize(event.venue!)}\n${event.date!}\nSESI 1 ${event.startTime!} - ${event.endTime!}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: vPaddingXL),
            ],
          ),
        ),
      ],
    );
  }
}
