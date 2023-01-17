import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Container(
      padding: EdgeInsets.zero,
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(themeNavy),
        image: DecorationImage(
          image: AssetImage("images/splashscreen_bg.png"),
          fit: BoxFit.fill,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage("images/my_jpj_icon.png"),
                  height: mediaHeight / 5,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Aplikasi Mudah Alih (SuperApps)\nJABATAN PENGANGKUTAN JALAN MALAYSIA",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 12,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
                letterSpacing: 0.42,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
