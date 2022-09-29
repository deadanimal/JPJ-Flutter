import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class TemplateHeader extends StatelessWidget {
  const TemplateHeader({
    Key? key,
    this.headerTitle = "",
    this.headerSubTitle = "",
    this.header,
  }) : super(key: key);
  final String headerTitle;
  final String headerSubTitle;
  final Widget? header;

  Widget title() {
    return Container(
      alignment: Alignment.centerLeft,
      width: mediaWidth,
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
      child: getTitle(),
    );
  }

  Widget _getSubtitle() {
    if (headerSubTitle != "") {
      return Text(
        headerSubTitle,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget getTitle() {
    if (header != null && headerTitle == "") {
      return header!;
    } else {
      return FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headerTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
              ),
            ),
            _getSubtitle(),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: (mediaHeight / 6) - kToolbarHeight / 2,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(boxShadow),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(headerGradient1), Color(headerGradient2)],
        ),
      ),
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
        top: 8,
        bottom: 8,
      ),
      child: title(),
    );
  }
}
