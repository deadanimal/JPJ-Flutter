import 'package:flutter/material.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/common/text_style.dart';
import 'package:jpj_info/view/mainpage/component/favButton.dart';
import 'component/button.dart';
import 'component/menu_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showMainPage(context);
  }

  Widget showMainPage(context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/main_bg.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: SingleChildScrollView(
          child: Column(
            children: [
              mainheader(context),
              favSubSection(context),
              mainSubSection(context),
              populateButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainheader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: const Image(
            image: AssetImage("images/my_jpj_icon.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        const SizedBox(width: 14),
        Text(
          AppLocalizations.of(context)!.welcome,
          style: CustomTextStyle().mainHeader(),
        ),
      ],
    );
  }

  Widget favSubSection(BuildContext context) {
    if (MyJPJAccountManager().isLoggedIn == true) {
      return Column(
        children: [
          Text(
            AppLocalizations.of(context)!.favourite,
            textAlign: TextAlign.center,
            style: CustomTextStyle().subHeader(),
          ),
          favSubsectionItems(),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget favSubsectionItems() {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            favMenuList.length,
            (index) {
              return CustomFavButton(
                item: serviceMenuList[index],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget mainSubSection(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.service,
      textAlign: TextAlign.center,
      style: CustomTextStyle().subHeader(),
    );
  }

  Widget populateButton(context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: List.generate(
          serviceMenuList.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(verticalPadding),
              child: button(
                serviceMenuList[index].menu,
                serviceMenuList[index].icon,
                serviceMenuList[index].cbFunc,
                context,
              ),
            );
          },
        ),
      ),
    );
  }
}
