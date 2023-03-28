import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jpj_info/helper/string_helper.dart';
import 'package:jpj_info/model/ehadir_event_info.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/summonsVerification/component/bordered_container.dart';
import 'package:jpj_info/view/template/template_header.dart';

class EhadirActivityList extends StatelessWidget {
  const EhadirActivityList({
    Key? key,
    required this.refreshCallback,
    required this.events,
    required this.viewActivityCallback,
  }) : super(key: key);
  final Function() refreshCallback;
  final Function(BuildContext, EHadirEventInfo) viewActivityCallback;
  final List<EHadirEventInfo> events;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Column(
      children: [
        TemplateHeader(
          headerTitle: AppLocalizations.of(context)!.activityList,
          headerTitleFontSize: 48,
          headerSubTitle: AppLocalizations.of(context)!.last10Activity,
        ),
        const SizedBox(height: vPaddingXL),
        Expanded(
          flex: 1,
          child: RefreshIndicator(
            onRefresh: () => refreshCallback(),
            child: Center(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: events.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: events.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return _activities(context, events[index]);
                        },
                      )
                    : ListView(
                        children: [
                          Text(
                            "${AppLocalizations.of(context)!.noRecord}\n(${AppLocalizations.of(context)!.pullToRefresh})",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(themeGray),
                              fontSize: 12,
                              fontFamily: "Roboto",
                              letterSpacing: 0.63,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _activities(BuildContext context, EHadirEventInfo event) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: CustomBorderedContainer(
          padding: const EdgeInsets.all(0),
          width: mediaWidth - 64,
          child: _cardContent(context, event),
        ),
      ),
    );
  }

  Widget _cardContent(BuildContext context, EHadirEventInfo event) {
    return Container(
      width: mediaWidth - 64,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(themeNavy),
      ),
      child: Row(
        children: [
          const Spacer(flex: 1),
          Expanded(
            flex: 15,
            child: Container(
              padding: const EdgeInsets.only(left: 8.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      capitalize(event.eventName!),
                      style: const TextStyle(
                        color: Color(0xff171f44),
                        fontSize: 20,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: vPaddingM),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${AppLocalizations.of(context)!.vanue}:",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Color(themeNavy),
                                  fontSize: 10,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: vPaddingS),
                              Text(
                                capitalize(event.venue ?? "-"),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Color(0xff2e2e2e),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${AppLocalizations.of(context)!.time}:",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Color(themeNavy),
                                  fontSize: 10,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: vPaddingS),
                              Text(
                                "${event.startTime ?? ''} - ${event.endTime ?? ''}",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Color(0xff2e2e2e),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: vPaddingM),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${AppLocalizations.of(context)!.date}:",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Color(themeNavy),
                                fontSize: 10,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: vPaddingS),
                            Text(
                              DateFormat('dd-MM-yyyy').format(
                                DateTime.parse(
                                  event.date!,
                                ),
                              ),
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Color(0xff2e2e2e),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            viewActivityCallback(context, event);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Color(themeNavy),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.remove_red_eye,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: vPaddingS),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
