import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/string_helper.dart';
import 'package:jpj_info/model/ehadir_event_info.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/summonsVerification/component/bordered_container.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        appBar: AppBarController(
          decor: customGradient,
          iconColor: Colors.white,
          hasBackButton: true,
          darkBtn: false,
          backCb: (context) {
            Navigator.pop(context);
          },
        ),
        body: _body(context),
        bottomNavigationBar: const BottomNavController(),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.activityDetail,
          ),
          const SizedBox(height: vPaddingXL),
          Center(
            child: Container(
              width: mediaWidth,
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  // const Image(
                  //   image: AssetImage("images/ehadir_man_and_clock.png"),
                  // ),
                  CustomBorderedContainer(
                    width: mediaWidth - 64,
                    child: Column(
                      children: [
                        Text(
                          capitalize(event.eventName!),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 35,
                            color: Color(themeNavy),
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: vPaddingM),
                        Text(
                          "${capitalize(event.venue ?? " ")}\n${_parseDateString(event.date ?? "")}\n${event.startTime ?? ''} - ${event.endTime ?? ''}",
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
          ),
        ],
      ),
    );
  }

  String _parseDateString(String raw) {
    List<String> retVal = raw.split('-');
    if (retVal.length < 3) {
      return raw;
    } else {
      return "${retVal[2]}-${retVal[1]}-${retVal[0]}";
    }
  }
}
