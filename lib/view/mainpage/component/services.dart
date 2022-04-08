import 'package:flutter/widgets.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/mainpage/component/button.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MenuItem> serviceMenu = MenuList(ctx: context).getServisMenuList();
    return Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(
        serviceMenu.length,
        (index) {
          bool enabled = true;
          if (serviceMenu[index].needLoggedIn) {
            enabled = serviceMenu[index].needLoggedIn &&
                MyJPJAccountManager().isLoggedIn;
          }
          return Padding(
            padding: const EdgeInsets.all(verticalPadding),
            child: button(
              serviceMenu[index].menu,
              serviceMenu[index].icon,
              serviceMenu[index].cbFunc,
              enabled,
              context,
            ),
          );
        },
      ),
    );
  }
}
