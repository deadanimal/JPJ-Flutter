import 'package:flutter/material.dart';
import 'package:jpj_info/helper/fav_menu.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';

class CustomFavButton extends StatelessWidget {
  const CustomFavButton({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final CustomMenuItem menu;

  @override
  Widget build(Object context) {
    return SizedBox(
      width: (mediaWidth - vPaddingXs * 6) / 3,
      height: 115,
      child: Padding(
        padding: const EdgeInsets.all(vPaddingXs),
        child: InkWell(
          onTap: () {
            if (menu.serviceId != null) {
              FavMenu().clicked(menu.serviceId!);
            }
            menu.cbFunc(context);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image(
                        image: menu.icon!,
                        width: 48,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topRight,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Center(
                    child: Text(
                      menu.menu!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xff393939),
                        fontSize: 12,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
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
