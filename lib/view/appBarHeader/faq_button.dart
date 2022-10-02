import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jpj_info/controller/faq_controller.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class FaqBtn extends StatelessWidget {
  const FaqBtn({Key? key, this.dark = false}) : super(key: key);

  final bool dark;

  @override
  Widget build(BuildContext context) {
    Color tint;
    if (dark) {
      tint = const Color(themeNavy);
    } else {
      tint = Colors.white;
    }
    return InkWell(
      onTap: () async {
        PDFDocument doc = await PDFDocument.fromURL(
          'https://api.caravel.space/jpj/faq/',
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return FaqController(doc: doc);
            },
          ),
        );
      },
      child: SvgPicture.asset(
        "images/vector/faq_icon.svg",
        semanticsLabel: 'Faq Icon',
        color: tint,
        height: 24,
      ),
    );
  }
}
