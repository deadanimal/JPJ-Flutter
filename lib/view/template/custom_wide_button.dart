import 'package:flutter/material.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class CustomWideButton extends StatelessWidget {
  const CustomWideButton({
    Key? key,
    required this.item,
  }) : super(key: key);
  final CustomMenuItem item;

  @override
  Widget build(BuildContext context) {
    Widget btn = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color(btnShadow),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        child: SizedBox(
          height: 67,
          child: InkWell(
            onTap: () {
              if (item.needLoggedIn && !MyJPJAccountManager().isLoggedIn) {
              } else {
                item.cbFunc(context);
              }
            },
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Image(
                    alignment: Alignment.centerRight,
                    image: item.icon!,
                    height: 50,
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    item.menu!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(themeNavy),
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (item.needLoggedIn && !MyJPJAccountManager().isLoggedIn) {
      btn = Opacity(
        opacity: 0.45,
        child: btn,
      );
    }
    return btn;
  }
}
