import 'package:flutter/material.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/view/template/custom_wide_button.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdministrativeMenu extends StatelessWidget {
  const AdministrativeMenu({Key? key}) : super(key: key);

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
              header: Center(
                child: Column(
                  children: [
                    Text(
                      MyJPJAccountManager().name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: verticalPadding),
                    Text(
                      MyJPJAccountManager().id,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: vPaddingXL),
            _bodyList(context),
            const SizedBox(height: vPaddingXL),
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
    List<MenuItem> transactionList = MenuList(ctx: context).getAdminMenuList();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
        transactionList.length,
        (index) {
          return CustomWideButton(
            item: transactionList[index],
          );
        },
      ),
    );
  }
}
