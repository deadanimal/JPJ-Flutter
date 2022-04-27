import 'package:flutter/material.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';

class CustomFavButton extends StatelessWidget {
  const CustomFavButton({
    Key? key,
    required this.item,
  }) : super(key: key);
  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(verticalPadding),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 121,
          height: 51,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(btnColor),
            boxShadow: const [
              BoxShadow(
                color: Color(btnShadow),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                icon(item.icon),
                Expanded(
                  flex: 6,
                  child: FittedBox(
                    child: Text(
                      item.menu!,
                      style: const TextStyle(
                        color: Colors.white,
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

  Widget icon(ImageProvider? icon) {
    if (icon == null) {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(right: vPaddingM),
        child: Image(
          image: icon,
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      );
    }
  }
}
