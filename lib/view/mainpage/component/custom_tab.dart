import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      width: mediaWidth - 64,
      child: TabBar(
        labelColor: const Color(themeGray),
        indicatorColor: Colors.transparent,
        unselectedLabelColor: Colors.grey.shade400,
        controller: tabController,
        tabs: [
          Text(
            AppLocalizations.of(context)!.service,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.staff,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
