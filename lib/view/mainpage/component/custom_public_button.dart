import 'package:flutter/material.dart';
import 'package:jpj_info/helper/fav_menu.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/view/common/spacing.dart';

class CustomPublicButton extends StatelessWidget {
  const CustomPublicButton({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final CustomMenuItem menu;

  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if (menu.serviceId != null) {
            FavMenu().clicked(menu.serviceId!);
          }
          menu.cbFunc(context);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: vPaddingM),
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: 55,
                  maxWidth: 55,
                ),
                child: Image(
                  image: menu.icon!,
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
            Text(
              menu.menu!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff393939),
                fontSize: 12,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
