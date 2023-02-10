import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/model/page_size.dart';

class EqHeader extends StatelessWidget {
  const EqHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(eqThemeOrange),
      height: (mediaHeight * 0.1),
      width: mediaWidth,
      child: const Image(
        image: AssetImage("images/jpjeq/smartq.png"),
        width: 64,
      ),
    );
  }
}
