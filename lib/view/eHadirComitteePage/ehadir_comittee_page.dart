import 'package:flutter/material.dart';
import 'package:jpj_info/helper/string_helper.dart';
import 'package:jpj_info/model/ehadir/activity_list_res.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/summonsVerification/component/bordered_container.dart';
import 'package:jpj_info/view/template/template_header.dart';

class EhadirComitteePage extends StatelessWidget {
  const EhadirComitteePage({
    Key? key,
    required this.refreshCallback,
    required this.events,
    required this.viewActivityCallback,
    required this.eraseActivityCallback,
  }) : super(key: key);
  final Function() refreshCallback;
  final Function(BuildContext, Aktiviti) eraseActivityCallback;
  final Function(BuildContext, Aktiviti) viewActivityCallback;
  final List<Aktiviti> events;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Column(
      children: [
        TemplateHeader(
          headerTitle: AppLocalizations.of(context)!.comittee,
          headerTitleFontSize: 48,
        ),
        const SizedBox(height: vPaddingM),
        Expanded(
          flex: 7,
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
                          return _comitee(context, events[index]);
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
        const Spacer(
          flex: 1,
        )
      ],
    );
  }

  Widget _comitee(BuildContext context, Aktiviti event) {
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

  Widget _cardContent(BuildContext context, Aktiviti event) {
    return Container(
      width: mediaWidth - 64,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(themeNavy)),
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
                    Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Text(
                            capitalize(event.namaAktiviti!),
                            maxLines: 3,
                            style: const TextStyle(
                              color: Color(0xff171f44),
                              fontSize: 20,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(child: _searchIcon(context, event)),
                        ),
                      ],
                    ),
                    const SizedBox(height: vPaddingM),
                    Row(
                      children: [
                        Expanded(
                          flex: 8,
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
                                capitalize(event.lokasi!),
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
                          flex: 2,
                          child: Container(child: _eraseIcon(context, event)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchIcon(BuildContext context, Aktiviti event) {
    return Container(
      width: 32,
      height: 32,
      decoration: navyGradientBtnDecoSquare,
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          viewActivityCallback(context, event);
        },
        child: const FittedBox(
          child: Center(
            child: Icon(Icons.remove_red_eye_outlined),
          ),
        ),
      ),
    );
  }

  Widget _eraseIcon(BuildContext context, Aktiviti event) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.red,
      ),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
        onPressed: () {
          eraseActivityCallback(context, event);
        },
        child: const FittedBox(
          child: Center(
            child: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
