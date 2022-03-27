import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class BottomBar extends StatelessWidget {
  BottomBar({
    Key? key,
    required this.tappedCallback,
    required this.items,
  }) : super(key: key);

  void Function(int index, BuildContext context) tappedCallback;
  List<BottomNavigationBarItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: BottomNavigationBar(
        unselectedItemColor: const Color(themeNavy),
        elevation: 0,
        items: items,
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          tappedCallback(index, context);
        },
      ),
    );
  }
}
