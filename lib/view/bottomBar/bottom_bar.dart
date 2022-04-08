import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class BottomBar extends StatelessWidget {
  BottomBar({
    Key? key,
    required this.tappedCallback,
    required this.items,
    required this.bgColor,
  }) : super(key: key);

  void Function(int index, BuildContext context) tappedCallback;
  List<BottomNavigationBarItem> items;
  Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 8, 24, 8),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          unselectedItemColor: const Color(themeNavy),
          elevation: 0,
          items: items,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            tappedCallback(index, context);
          },
        ),
      ),
    );
  }
}
