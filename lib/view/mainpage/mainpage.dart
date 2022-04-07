import 'package:flutter/material.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/common/text_style.dart';
import 'package:jpj_info/view/mainpage/component/favButton.dart';
import 'component/button.dart';
import '../../helper/menu_list.dart';
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
      child: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 400,
            maxHeight: double.infinity,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                mainheader(context),
                userInfo(context),
                favSubSection(context),
                mainSubSection(context),
                populateButton(context),
                const SizedBox(height: vPaddingXL),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: BottomNavController(
                    darkTheme: true,
                    inHome: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userInfo(BuildContext context) {
    if (MyJPJAccountManager().isLoggedIn) {
      return Padding(
        padding: const EdgeInsets.only(top: vPaddingM, bottom: vPaddingXL),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyJPJAccountManager().name,
                style: const TextStyle(
                  color: Color(themeOrange),
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                MyJPJAccountManager().email,
                style: const TextStyle(
                  color: Color(themeOrange),
                  fontSize: 10,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.lastLoggedIn,
                style: const TextStyle(
                  fontSize: 9,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                MyJPJAccountManager().lastLoggedIn,
                style: const TextStyle(
                  fontSize: 9,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget mainheader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
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
          favSubsectionItems(context),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget favSubsectionItems(BuildContext context) {
    List<MenuItem> favMenuList = MenuList(ctx: context).getFavMenuList();
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            favMenuList.length,
            (index) {
              return CustomFavButton(
                item: favMenuList[index],
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
    List<MenuItem> serviceMenu = MenuList(ctx: context).getServisMenuList();
    return Center(
      child: Wrap(
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
      ),
    );
  }
}
