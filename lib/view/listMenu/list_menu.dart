import 'package:flutter/material.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/template/custom_wide_button.dart';
import 'package:jpj_info/view/template/template_header.dart';

class CustomListMenu extends StatelessWidget {
  const CustomListMenu({
    Key? key,
    required this.transactionList,
    required this.title,
  }) : super(key: key);
  final List<CustomMenuItem> transactionList;
  final String title;

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
      width: mediaWidth - 64,
      child: Padding(
        padding: const EdgeInsets.only(
            top: verticalPadding, bottom: verticalPadding),
        child: serviceButton(context),
      ),
    );
  }

  Widget serviceButton(BuildContext context) {
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
