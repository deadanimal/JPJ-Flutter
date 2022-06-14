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
        labelColor: const Color(themeNavy),
        indicatorColor: Colors.transparent,
        unselectedLabelColor: Colors.black45,
        controller: tabController,
        tabs: [
          Container(
            height: 36,
            width: (mediaWidth - 64) / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white70,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(
                child: Text(
                  AppLocalizations.of(context)!.service,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 36,
            width: (mediaWidth - 64) / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white70,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: FittedBox(
                child: Text(
                  AppLocalizations.of(context)!.staff,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
