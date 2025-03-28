import 'package:flutter/material.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/mainpage/component/custom_public_menu_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Services extends StatelessWidget {
  const Services({Key? key, required this.favMenuList}) : super(key: key);
  final List<CustomMenuItem> favMenuList;

  @override
  Widget build(BuildContext context) {
    List<CustomMenuItem> serviceMenu =
        MenuList(ctx: context).getServisMenuList();
    List<CustomMenuItem> transectionMenu =
        MenuList(ctx: context).getOnlineTransactionList();
    List<CustomMenuItem> supportServiceMenu = [
      serviceMenu[1],
      serviceMenu[2],
    ];
    List<CustomMenuItem> licenseMenu = [
      serviceMenu[0],
      transectionMenu[0],
      transectionMenu[3],
    ];
    List<CustomMenuItem> driverMenu = [
      transectionMenu[1],
      transectionMenu[2],
    ];
    List<CustomMenuItem> kSectionMenu = [
      transectionMenu[4],
      transectionMenu[6],
      transectionMenu[5],
    ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomPublicMenuSection(
          serviceMenu: favMenuList,
          subHeader: AppLocalizations.of(context)!.favourite,
          fav: true,
        ),
        const SizedBox(height: vPaddingM),
        Container(
          color: Colors.grey.shade100,
          child: CustomPublicMenuSection(
            serviceMenu: licenseMenu,
            subHeader: AppLocalizations.of(context)!.licensesService,
          ),
        ),
        const SizedBox(height: vPaddingM),
        CustomPublicMenuSection(
          serviceMenu: driverMenu,
          subHeader: AppLocalizations.of(context)!.driverService,
        ),
        const SizedBox(height: vPaddingM),
        Container(
          color: Colors.grey.shade100,
          child: CustomPublicMenuSection(
            serviceMenu: kSectionMenu,
            subHeader: AppLocalizations.of(context)!.kSection,
          ),
        ),
        const SizedBox(height: vPaddingM),
        CustomPublicMenuSection(
          serviceMenu: supportServiceMenu,
          subHeader: AppLocalizations.of(context)!.supportServices,
        ),
        const SizedBox(height: vPaddingM),
      ],
    );
  }
}
