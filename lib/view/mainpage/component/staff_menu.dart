import 'package:flutter/widgets.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/view/mainpage/component/custom_public_menu_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StaffMenu extends StatelessWidget {
  const StaffMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CustomMenuItem> serviceMenu = [];
    return CustomPublicMenuSection(
      serviceMenu: serviceMenu,
      subHeader: AppLocalizations.of(context)!.staff,
    );
  }
}
