import 'package:flutter/material.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/eAduanMenu/component/custom_icon_menu_list.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EaduanMenu extends StatelessWidget {
  const EaduanMenu({
    Key? key,
    required this.transactionList,
    required this.title,
    required this.draftStatusCallback,
  }) : super(key: key);
  final List<CustomMenuItem> transactionList;
  final String title;
  final Function(BuildContext) draftStatusCallback;

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
              headerTitle: title,
            ),
            const SizedBox(height: vPaddingM),
            Container(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  onPressed: () {
                    draftStatusCallback(context);
                  },
                  decoration: navyGradientBtnDeco,
                  label: AppLocalizations.of(context)!.draftSent,
                  width: 150,
                  textSize: 15,
                ),
              ),
            ),
            const SizedBox(height: vPaddingM),
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
      width: mediaWidth - 64,
      child: serviceButton(context),
    );
  }

  Widget serviceButton(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
        transactionList.length,
        (index) {
          return CustomIconMenuButton(
            item: transactionList[index],
          );
        },
      ),
    );
  }
}
