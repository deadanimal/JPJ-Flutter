import 'package:flutter/material.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/common/text_style.dart';
import 'package:jpj_info/view/mainpage/component/custom_tab.dart';
import 'package:jpj_info/view/mainpage/component/fav_button.dart';
import 'package:jpj_info/view/mainpage/component/services.dart';
import 'package:jpj_info/view/mainpage/component/staff_menu.dart';
import '../../helper/menu_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> with TickerProviderStateMixin {
  _MainPage();

  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return showMainPage(context);
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget showMainPage(context) {
    return Container(
      width: mediaWidth,
      height: mediaHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/main_bg.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 400,
            maxHeight: mediaHeight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              mainheader(context),
              favSubSection(context),
              mainSubSection(context),
              Expanded(child: populateButton(context)),
            ],
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
              Container(
                width: mediaWidth,
                constraints: const BoxConstraints(maxWidth: 250),
                child: Text(
                  MyJPJAccountManager().name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(themeOrange),
                    fontSize: 18,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                  ),
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
            width: 84,
          ),
        ),
        const SizedBox(width: 8),
        userInfo(context),
      ],
    );
  }

  Widget favSubSection(BuildContext context) {
    if (MyJPJAccountManager().isLoggedIn == true) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white54,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Text(
                AppLocalizations.of(context)!.favourite,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(themeGray),
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          favSubsectionItems(context),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget favSubsectionItems(BuildContext context) {
    List<CustomMenuItem> favMenuList = MenuList(ctx: context).getFavMenuList();
    return FittedBox(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0, top: 0),
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
    if (MyJPJAccountManager().type == UserType.staff) {
      return CustomTab(tabController: tabController);
    } else {
      return Text(
        AppLocalizations.of(context)!.service,
        textAlign: TextAlign.center,
        style: CustomTextStyle().subHeader(),
      );
    }
  }

  Widget populateButton(context) {
    if (MyJPJAccountManager().type == UserType.staff) {
      return Container(
        width: mediaWidth,
        constraints: const BoxConstraints(maxWidth: 400),
        child: TabBarView(
          controller: tabController,
          children: const [
            Services(),
            StaffMenu(),
          ],
        ),
      );
    } else {
      return const Services();
    }
  }
}
