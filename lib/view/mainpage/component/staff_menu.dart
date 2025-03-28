import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/view/mainpage/component/custom_public_menu_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StaffMenu extends StatelessWidget {
  const StaffMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomMenuItem> serviceMenu =
        MenuList(ctx: context).getStaffMenuList();
    return Container(
      color: Colors.grey.shade200,
      child: CustomPublicMenuSection(
        serviceMenu: serviceMenu,
        subHeader: AppLocalizations.of(context)!.staff,
      ),
    );
  }
}
