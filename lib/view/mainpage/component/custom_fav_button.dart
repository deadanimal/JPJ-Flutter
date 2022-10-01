import 'package:flutter/material.dart';
import 'package:jpj_info/helper/fav_menu.dart';
import 'package:jpj_info/model/mainpage_icon.dart';

class CustomFavButton extends StatelessWidget {
  const CustomFavButton({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final CustomMenuItem menu;

  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 117, maxHeight: 180),
        child: InkWell(
          onTap: () {
            if (menu.serviceId != null) {
              FavMenu().clicked(menu.serviceId!);
            }
            menu.cbFunc(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: menu.icon!,
                width: 48,
                height: 48,
                fit: BoxFit.fitWidth,
              ),
              Container(
                height: 48,
                padding: const EdgeInsets.only(
                  right: 5,
                  left: 5,
                  top: 2,
                  bottom: 2,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: const Color(0xFF202E5C),
                ),
                child: Center(
                  child: Text(
                    menu.menu!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: "Roboto",
                    ),
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
