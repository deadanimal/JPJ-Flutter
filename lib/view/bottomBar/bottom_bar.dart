import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.tappedCallback,
    required this.items,
    required this.bgColor,
    this.textColor = const Color(themeNavy),
  }) : super(key: key);

  final void Function(int index, BuildContext context) tappedCallback;
  final List<BottomNavigationBarItem> items;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 8,
      ),
      child: BottomNavigationBar(
        backgroundColor: bgColor,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: textColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        elevation: 0,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        items: items,
        selectedItemColor: textColor,
        onTap: (index) {
          tappedCallback(index, context);
        },
      ),
    );
  }
}
