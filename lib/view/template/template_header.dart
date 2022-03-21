import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class TemplateHeader {
  late String headerTitle;

  void setHeader(String title) {
    headerTitle = title;
  }

  Widget header() {
    return Container(
      height: mediaHeight / 5,
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
          colors: [Color(heederGradient1), Color(heederGradient2)],
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

  Widget title() {
    return Container(
      alignment: Alignment.centerLeft,
      width: mediaWidth,
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: FittedBox(
        child: Text(
          headerTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 55,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
