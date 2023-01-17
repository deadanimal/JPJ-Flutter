import 'package:flutter/material.dart';
import 'package:jpj_info/helper/fav_menu.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';

class CustomPublicButton extends StatelessWidget {
  const CustomPublicButton({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final CustomMenuItem menu;

  @override
  Widget build(Object context) {
    // debugPrint(menu.icon.toString());
    return SizedBox(
      width: (mediaWidth - vPaddingXs * 6) / 4,
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
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              // image: DecorationImage(
              //   image: menu.icon!,
              //   fit: BoxFit.fill,
              // ),
              // color: Color.fromARGB(255, 213, 217, 255),
              // color: Color.fromARGB(255, 182, 196, 242)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    menu.menu!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Color(0xff393939),
                      fontSize: 14,
                      height: 0.9,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image(
                        image: menu.icon!,
                        width: 60,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topRight,
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
