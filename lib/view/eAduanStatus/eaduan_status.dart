import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/eAduanStatus/component/status_card_view.dart';
import 'package:jpj_info/view/form/custom_button.dart';

class EaduanStatus extends StatelessWidget {
  const EaduanStatus({
    Key? key,
    required this.tabController,
  }) : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SizedBox(
      width: mediaWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: vPaddingXL),
          Text(
            AppLocalizations.of(context)!.listOfComplaint,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff171f44),
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
          const SizedBox(height: vPaddingXL),
          _tabTitle(context),
          Expanded(child: _tabView(context)),
        ],
      ),
    );
  }

  Widget _tabTitle(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      width: mediaWidth,
      child: TabBar(
        labelColor: const Color(themeGray),
        indicatorColor: const Color(themeNavy),
        unselectedLabelColor: Colors.grey.shade400,
        controller: tabController,
        tabs: [
          Text(
            AppLocalizations.of(context)!.sent,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.draft,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabView(BuildContext context) {
    return Container(
      width: mediaWidth,
      constraints: const BoxConstraints(maxWidth: 400),
      child: TabBarView(
        controller: tabController,
        children: [
          _sentTab(context),
          _draftTab(context),
        ],
      ),
    );
  }

  Widget _sentTab(BuildContext context) {
    return Column(
      children: [
        StatusCardView(
          width: mediaWidth - 64,
          leading: _status(context),
          trailing: _searchIcon(),
        ),
        StatusCardView(
          width: mediaWidth - 64,
          leading: _status(context),
          trailing: _searchIcon(),
        ),
      ],
    );
  }

  Widget _draftTab(BuildContext context) {
    return Column(
      children: [
        StatusCardView(
          width: mediaWidth - 64,
          leading: _draftStatus(context),
          trailing: _draftIcon(),
        ),
        StatusCardView(
          width: mediaWidth - 64,
          leading: _draftStatus(context),
          trailing: _draftIcon(),
        ),
      ],
    );
  }

  Widget _status(BuildContext context) {
    return CustomButton(
      width: 95,
      onPressed: () {},
      label: AppLocalizations.of(context)!.received,
      decoration: greenGradientBtnDeco,
      textSize: 10,
    );
  }

  Widget _draftStatus(BuildContext context) {
    return CustomButton(
      width: 95,
      onPressed: () {},
      label: AppLocalizations.of(context)!.draft,
      decoration: yellowGradientBtnDeco,
      textSize: 10,
    );
  }

  Widget _searchIcon() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(vPaddingM),
        child: Container(
          decoration: navyGradientBtnDecoSquare,
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.search),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _draftIcon() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(vPaddingM),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff157ad8),
              ),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.edit_note_outlined),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.red,
              ),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.delete_outline_outlined),
                  ],
                ),
              ),
            ),
            Container(
              decoration: navyGradientBtnDecoSquare,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.search),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
