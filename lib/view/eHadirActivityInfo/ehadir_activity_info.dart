import 'package:flutter/material.dart';
import 'package:jpj_info/model/ehadir_comittee_info.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/eHadirActivityInfo/component/comittee_list.dart';
import 'package:jpj_info/view/eHadirActivityInfo/component/info_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EhadirActivityInfo extends StatelessWidget {
  const EhadirActivityInfo({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Container(
        width: mediaWidth,
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          children: [
            const Image(
              image: AssetImage("images/ehadir_men_at_work.png"),
            ),
            const SizedBox(height: vPaddingXL),
            _tabHeader(context),
            Expanded(child: _tabView(context)),
            const SizedBox(height: vPaddingXL),
          ],
        ),
      ),
    );
  }

  Widget _tabHeader(BuildContext context) {
    return TabBar(
      labelColor: const Color(themeGray),
      indicatorColor: const Color(themeNavy),
      unselectedLabelColor: Colors.grey.shade400,
      controller: tabController,
      tabs: [
        FittedBox(
          child: Text(
            AppLocalizations.of(context)!.info,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
        ),
        FittedBox(
          child: Text(
            AppLocalizations.of(context)!.comittee,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
        ),
        FittedBox(
          child: Text(
            AppLocalizations.of(context)!.attendance,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
        ),
      ],
    );
  }

  Widget _tabView(BuildContext context) {
    return SizedBox(
      width: mediaWidth - 64,
      child: TabBarView(
        controller: tabController,
        children: [
          const InfoTab(),
          ComitteeList(
            comitteeList: [
              ComitteeInfo("name", "department"),
              ComitteeInfo("name", "department"),
              ComitteeInfo("name", "department"),
            ],
          ),
          const InfoTab(),
        ],
      ),
    );
  }
}
