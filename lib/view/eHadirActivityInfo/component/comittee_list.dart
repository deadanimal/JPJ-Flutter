import 'package:flutter/material.dart';
import 'package:jpj_info/controller/menu_action.dart';
import 'package:jpj_info/model/ehadir_comittee_info.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/spacing.dart';

class ComitteeList extends StatelessWidget {
  const ComitteeList({
    Key? key,
    required this.comitteeList,
  }) : super(key: key);
  final List<ComitteeInfo> comitteeList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: vPaddingM),
        _addComitteeBtn(context),
        const SizedBox(height: vPaddingM),
        _comitteeList(context),
      ],
    );
  }

  Widget _addComitteeBtn(BuildContext context) {
    return Container(
      width: mediaWidth - 64,
      constraints: const BoxConstraints(maxWidth: 400),
      child: InkWell(
        onTap: () => eHadirAddComitteePage(context),
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                primary: const Color(themeNavy),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(19),
              ),
            ),
            Text(
              AppLocalizations.of(context)!.addComittee,
              style: const TextStyle(
                color: Color(0xff171f44),
                fontSize: 12,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                letterSpacing: 0.42,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _comitteeList(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: comitteeList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _comitteeInfo(context, comitteeList[index]);
      },
    );
  }

  Widget _comitteeInfo(BuildContext context, ComitteeInfo info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          info.name,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xff171f44),
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          info.department,
          style: const TextStyle(
            color: Color(0xff171f44),
            fontSize: 10,
          ),
        ),
        const Divider(color: Colors.black),
      ],
    );
  }
}
