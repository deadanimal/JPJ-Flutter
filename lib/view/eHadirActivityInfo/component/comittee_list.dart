import 'package:flutter/material.dart';
import 'package:jpj_info/controller/menu_action.dart';
import 'package:jpj_info/model/ehadir_comittee_info.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/eHadirActivityInfo/component/ehadir_people_list.dart';

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
        PeopleList(comitteeList: comitteeList),
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
              style: ElevatedButton.styleFrom(
                primary: const Color(themeNavy),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(19),
              ),
              child: const Icon(Icons.add),
            ),
            Text(
              AppLocalizations.of(context)!.addComittee,
              style: const TextStyle(
                color: Color(0xff171f44),
                fontSize: 12,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
                letterSpacing: 0.42,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
