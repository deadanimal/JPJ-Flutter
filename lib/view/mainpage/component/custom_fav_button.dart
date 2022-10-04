import 'package:flutter/material.dart';
import 'package:jpj_info/helper/fav_menu.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/view/common/spacing.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: menu.icon!,
                width: 48,
                height: 48,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: vPaddingS,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    constraints: const BoxConstraints(maxWidth: 117),
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
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
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
            ],
          ),
        ),
      ),
    );
  }
}
