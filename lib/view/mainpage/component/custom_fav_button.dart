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
      width: (mediaWidth - vPaddingXs * 6) / 4,
      height: 125,
      child: Padding(
        padding: const EdgeInsets.all(vPaddingM),
        child: InkWell(
          onTap: () {
            if (menu.serviceId != null) {
              FavMenu().clicked(menu.serviceId!);
            }
            menu.cbFunc(context);
          },
          child: Container(
            decoration: BoxDecoration(
              // color: Color.fromARGB(255, 213, 217, 255),
              color: Color.fromARGB(255, 255, 240, 213),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                      child: Image(
                        image: menu.icon!,
                        width: 48,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topRight,
                      ),
                    ),
                    const SizedBox(height: verticalPadding),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Center(
                        child: Text(
                          menu.menu!,
                          textAlign: TextAlign.center,
                          // overflow: TextOverflow.clip,
                          style: const TextStyle(
                            color: Color(0xff393939),
                            fontSize: 12,
                            height: 0.9,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
