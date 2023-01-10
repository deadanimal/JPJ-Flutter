import 'package:flutter/material.dart';
import 'package:jpj_info/view/appBarHeader/faq_button.dart';
import 'package:jpj_info/view/appBarHeader/lang_button.dart';
import 'package:jpj_info/view/common/spacing.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.decor = const BoxDecoration(),
    this.darkBtn = false,
    this.iconColor = Colors.white,
    required this.bottomDrawer,
    required this.hasBackButton,
    this.backCb,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  final BoxDecoration decor;
  final bool darkBtn;
  final Color iconColor;
  final Widget bottomDrawer;
  final bool hasBackButton;
  final Function(BuildContext)? backCb;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasBackButton
          ? BackButton(
              color: iconColor,
              onPressed: () {
                if (backCb != null) {
                  backCb!(context);
                } else {
                  Navigator.pop(context);
                }
              },
            )
          : null,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: iconColor),
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: decor,
        child: Center(
          child: Padding(
            padding: hasBackButton
                ? const EdgeInsets.only(left: 32.0)
                : EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: horizontalPadding),
                    const Image(
                      image: AssetImage("images/jpj_official_icon.png"),
                      height: 30,
                    ),
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
                        return bottomDrawer;
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
      ),
    );
  }
}
