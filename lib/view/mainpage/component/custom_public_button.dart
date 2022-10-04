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
      padding: const EdgeInsets.all(vPaddingXs),
      child: InkWell(
        onTap: () {
          if (menu.serviceId != null) {
            FavMenu().clicked(menu.serviceId!);
          }
          menu.cbFunc(context);
        },
        child: Container(
          width: 117,
          height: 96,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image(
                      image: menu.icon!,
                      width: 55,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: FittedBox(
                  child: Text(
                    menu.menu!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: Color(0xff393939),
                      fontSize: 15,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w700,
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
