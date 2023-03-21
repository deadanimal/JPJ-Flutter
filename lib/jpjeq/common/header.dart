import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/model/page_size.dart';

class EqHeader extends StatelessWidget {
  const EqHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(eqThemeOrange),
      height: (mediaHeight * 0.15),
      width: mediaWidth,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                InkWell(
                  child: const Icon(Icons.arrow_back),
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                ),
              ],
            ),
          ),
          Image(
            image: const AssetImage("images/jpjeq/smartq.png"),
            height: mediaHeight * 0.1,
          ),
        ],
      ),
    );
  }
}
