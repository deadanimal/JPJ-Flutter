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
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  final BoxDecoration decor;
  final bool darkBtn;
  final Color iconColor;
  final Widget bottomDrawer;
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
    );
  }
}
