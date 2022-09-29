import 'package:flutter/material.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/mainpage/component/custom_fav_button.dart';
import 'package:jpj_info/view/mainpage/component/custom_public_button.dart';

class CustomPublicMenuSection extends StatelessWidget {
  const CustomPublicMenuSection({
    Key? key,
    required this.serviceMenu,
    required this.subHeader,
    this.fav = false,
  }) : super(key: key);
  final List<CustomMenuItem> serviceMenu;
  final String subHeader;
  final bool fav;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 12,
        bottom: 16,
      ),
      constraints: const BoxConstraints(maxWidth: 400),
      width: mediaWidth - 32,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(right: 5, left: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade100,
            ),
            child: Text(
              subHeader,
              style: const TextStyle(
                color: Color(0xff171f44),
                fontSize: 15,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: vPaddingS),
          Container(
            constraints: const BoxConstraints(maxHeight: 130),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    fav
                        ? CustomFavButton(menu: serviceMenu[index])
                        : CustomPublicButton(menu: serviceMenu[index]),
                    const SizedBox(width: vPaddingM),
                  ],
                );
              },
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: serviceMenu.length,
            ),
          ),
        ],
      ),
    );
  }
}
