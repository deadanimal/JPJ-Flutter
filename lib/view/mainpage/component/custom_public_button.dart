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
          width: 160,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        minHeight: 50,
                        maxHeight: 64,
                      ),
                      width: 96,
                      child: Center(
                        child: Text(
                          menu.menu!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Color(0xff393939),
                            fontSize: 14,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Image(
                      image: menu.icon!,
                      width: 48,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
