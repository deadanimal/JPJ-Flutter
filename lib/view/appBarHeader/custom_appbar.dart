import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/appBarHeader/faq_button.dart';
import 'package:jpj_info/view/appBarHeader/lang_button.dart';
import 'package:jpj_info/view/appBarHeader/lang_selector.dart';
import 'package:jpj_info/view/bottomDrawer/bottom_drawer.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.decor = const BoxDecoration(),
    this.darkBtn = false,
    this.iconColor = Colors.white,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  final BoxDecoration decor;
  final bool darkBtn;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: iconColor),
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: decor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: horizontalPadding),
                  LanguageBtn(
                    dark: darkBtn,
                  ),
                  const SizedBox(width: horizontalPadding),
                  FaqBtn(dark: darkBtn),
                ],
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "images/vector/inbox_icon.svg",
                                  semanticsLabel: 'Language Icon',
                                  color: const Color(themeNavy),
                                  height: 24,
                                ),
                                Text(
                                  "Peti Masuk",
                                  style: TextStyle(
                                    color: Color(0xff393939),
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "images/vector/share_icon.svg",
                                  semanticsLabel: 'Language Icon',
                                  color: const Color(themeNavy),
                                  height: 24,
                                ),
                                Text(
                                  "Share App",
                                  style: TextStyle(
                                    color: Color(0xff393939),
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "images/vector/logout_icon.svg",
                                  semanticsLabel: 'Language Icon',
                                  color: const Color(themeNavy),
                                  height: 24,
                                ),
                                Text(
                                  "Log Out",
                                  style: TextStyle(
                                    color: Color(0xff393939),
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: hPaddingM),
                  child: Icon(
                    Icons.menu_rounded,
                    color: iconColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
