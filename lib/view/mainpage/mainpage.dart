import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/navbar/navbar.dart';
import 'component/button.dart';
import 'component/menu_list.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          endDrawer: const NavBar(),
          appBar: AppBar(
            foregroundColor: Colors.black,
            shadowColor: Colors.transparent,
            toolbarHeight: 96,
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  child: const Image(
                    image: AssetImage("images/my_jpj_icon.png"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
                const SizedBox(width: 14),
                const Text(
                  "Selamat\nDatang",
                  style: TextStyle(
                    color: Color(0xff171f44),
                    fontSize: 30,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
          ),
          body: showMainPage(context),
        ),
      ),
    );
  }

  Widget showMainPage(context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/main_bg.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            mainheader(),
            populateButton(context),
          ],
        ),
      ),
    );
  }

  Widget mainheader() {
    return const Text(
      "SERVIS",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Color(0xff8b9eb0),
        fontSize: 30,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget populateButton(context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(a.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(verticalPadding),
                child: button(
                  a[index].menu,
                  a[index].icon,
                  a[index].cbFunc,
                  context,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
