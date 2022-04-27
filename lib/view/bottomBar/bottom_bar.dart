import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.tappedCallback,
    required this.items,
    required this.bgColor,
  }) : super(key: key);

  final void Function(int index, BuildContext context) tappedCallback;
  final List<BottomNavigationBarItem> items;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(style: BorderStyle.none),
        color: bgColor,
      ),
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
