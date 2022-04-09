import 'package:flutter/material.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/view/serviceList/component/button.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/main_bg.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TemplateHeader(
              headerTitle: AppLocalizations.of(context)!.onlineTransaction,
            ),
            const SizedBox(height: vPaddingXL),
            _bodyList(context),
            const SizedBox(height: vPaddingXL),
            Container(
              alignment: Alignment.bottomCenter,
              child: BottomNavController(
                darkTheme: true,
                inMenu: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bodyList(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Padding(
        padding: const EdgeInsets.only(
            top: verticalPadding, bottom: verticalPadding),
        child: serviceButton(context),
      ),
    );
  }

  Widget serviceButton(BuildContext context) {
    List<MenuItem> transactionList =
        MenuList(ctx: context).getOnlineTransactionList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
        transactionList.length,
        (index) {
          return CustomServiceButton(
            item: transactionList[index],
          );
        },
      ),
    );
  }
}
