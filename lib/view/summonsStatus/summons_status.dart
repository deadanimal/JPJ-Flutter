import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/expansion_list.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/summonsStatus/component/expandable_container.dart';
import 'package:jpj_info/view/template/component/custom_subtitle.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SummonsStatus extends StatefulWidget {
  const SummonsStatus({
    Key? key,
    required this.data,
  }) : super(key: key);
  final List<CustomExpensionList> data;

  @override
  State<StatefulWidget> createState() => _SummonsStatus();
}

class _SummonsStatus extends State<SummonsStatus> {
  int noOfSelectedSummons = 0;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: _showPageContent(context),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  Widget _showPageContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.ticket,
          ),
          _subTitle(context),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            width: mediaWidth - 16,
            child: _result(context, widget.data),
          ),
          const SizedBox(
            height: vPaddingXL,
          ),
          // CustomButton(
          //   width: mediaWidth - 64,
          //   onPressed: () {},
          //   decoration: navyGradientBtnDeco,
          //   label: AppLocalizations.of(context)!.transactionList,
          // ),
          // const SizedBox(
          //   height: vPaddingM,
          // ),
          // CustomButton(
          //   width: mediaWidth - 64,
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) {
          //           return const SummonsVerificationController();
          //         },
          //       ),
          //     );
          //   },
          //   textColor: const Color(themeNavy),
          //   decoration: whiteBtnDeco,
          //   label:
          //       "${AppLocalizations.of(context)!.choose} $noOfSelectedSummons ${AppLocalizations.of(context)!.ticket}",
          // )
        ],
      ),
    );
  }

  Widget _result(BuildContext context, List<CustomExpensionList>? summons) {
    if (summons != null && summons.isNotEmpty) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: summons.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: verticalPadding),
              CustomExpandableContainer(
                data: summons[index].data,
                checkboxCallback: (checked, id) {
                  noOfSelectedSummons = 0;
                  for (var el in widget.data) {
                    if (el.data.notisId == id) {
                      el.isSelected = checked ?? false;
                    }
                    if (el.isSelected) {
                      setState(() {
                        noOfSelectedSummons = noOfSelectedSummons + 1;
                      });
                    }
                  }
                },
              ),
            ],
          );
        },
      );
    } else {
      return Center(
        child: Text(
          AppLocalizations.of(context)!.noRecord,
          style: const TextStyle(fontSize: 15),
        ),
      );
    }
  }

  Widget _subTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: vPaddingM,
        top: vPaddingXL,
      ),
      child: CustomSubtitle(
        subtitle: AppLocalizations.of(context)!.searchResult,
      ),
    );
  }
}
