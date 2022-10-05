import 'package:flutter/material.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/mainpage/component/services.dart';
import 'package:jpj_info/view/mainpage/component/staff_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/template/template_header.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.favMenuList}) : super(key: key);

  final List<CustomMenuItem> favMenuList;

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
      child: Container(
        constraints: BoxConstraints(
          maxHeight: mediaHeight,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            TemplateHeader(
              header: mainheader(context),
            ),
            const SizedBox(height: vPaddingM),
            populateButton(context),
          ],
        ),
      ),
    );
  }

  Widget userInfo(BuildContext context) {
    if (MyJPJAccountManager().isLoggedIn) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Text(
              MyJPJAccountManager().name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Text(
            MyJPJAccountManager().email,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: "Poppins",
            ),
          ),
          Text(
            "${AppLocalizations.of(context)!.lastLoggedIn}: ${MyJPJAccountManager().lastLoggedIn}",
            maxLines: 1,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: "Poppins",
            ),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Widget mainheader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 223, 106),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              MyJPJAccountManager().name[0].toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Poppins",
                fontSize: 32,
              ),
            ),
          ),
        ),
        const SizedBox(width: vPaddingM),
        Expanded(
          child: userInfo(context),
        ),
      ],
    );
  }

  Widget populateButton(context) {
    if (MyJPJAccountManager().type == UserType.staff) {
      return Column(
        children: [
          Services(
            favMenuList: widget.favMenuList,
          ),
          const StaffMenu(),
        ],
      );
    } else {
      return Services(
        favMenuList: widget.favMenuList,
      );
    }
  }
}
