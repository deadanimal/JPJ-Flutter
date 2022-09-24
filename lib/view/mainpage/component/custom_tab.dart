import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key, required this.tabController}) : super(key: key);
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 350),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(52.94),
        gradient: const LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [Color(0xff2b388d), Color(0xff071151)],
        ),
      ),
      width: mediaWidth - 86,
      child: TabBar(
        labelColor: Colors.white,
        automaticIndicatorColorAdjustment: true,
        unselectedLabelColor: Colors.grey,
        controller: tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(52.94),
          boxShadow: const [
            BoxShadow(
              color: Color(0x59000000),
              blurRadius: 2.12,
              offset: Offset(0, 0),
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff2b388d), Color(0xff132281)],
          ),
        ),
        tabs: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              AppLocalizations.of(context)!.service,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              AppLocalizations.of(context)!.staff,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
