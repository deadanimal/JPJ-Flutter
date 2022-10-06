import 'package:badges/badges.dart';
import 'package:flexible_scrollbar/flexible_scrollbar.dart';
import 'package:flutter/material.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/mainpage/component/custom_fav_button.dart';
import 'package:jpj_info/view/mainpage/component/custom_public_button.dart';

class CustomPublicMenuSection extends StatelessWidget {
  CustomPublicMenuSection({
    Key? key,
    required this.serviceMenu,
    required this.subHeader,
    this.fav = false,
  }) : super(key: key);
  final List<CustomMenuItem> serviceMenu;
  final String subHeader;
  final bool fav;
  ScrollController sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 12,
      ),
      width: mediaWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              padding: const EdgeInsets.only(right: 5, left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFF9F9F9),
              ),
              child: fav
                  ? Badge(
                      badgeContent: const Text(
                        "Top\n5",
                        style: TextStyle(fontSize: 8),
                        textAlign: TextAlign.center,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      shape: BadgeShape.square,
                      stackFit: StackFit.passthrough,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          subHeader,
                          style: const TextStyle(
                            color: Color(0xff171f44),
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    )
                  : Text(
                      subHeader,
                      style: const TextStyle(
                        color: Color(0xff171f44),
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(maxHeight: fav ? 110 : 100),
            width: mediaWidth,
            child: FlexibleScrollbar(
              controller: sc,
              alwaysVisible: true,
              // scrollThumbBuilder: (ScrollbarInfo info) {
              //   return Container(
              //     color: Colors.green,
              //     height: 15,
              //     width: 20,
              //   );
              // },
              child: ListView.builder(
                controller: sc,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      fav
                          ? CustomFavButton(menu: serviceMenu[index])
                          : CustomPublicButton(menu: serviceMenu[index]),
                      const SizedBox(width: vPaddingXs),
                    ],
                  );
                },
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: serviceMenu.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
