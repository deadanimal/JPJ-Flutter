import 'package:flutter/widgets.dart';
import 'package:jpj_info/jpjeq/common/header.dart';
import 'package:jpj_info/model/page_size.dart';

class JpjEqHomepage extends StatelessWidget {
  const JpjEqHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Column(
      children: const [
        EqHeader(),
      ],
    );
  }
}
