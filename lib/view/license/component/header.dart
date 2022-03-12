import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import '../../common/color_scheme.dart';

Widget licenseHeader() {
  return Container(
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
    width: mediaWidth,
    padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
    child: const Text(
      "Lesen\nMemandu",
      style: TextStyle(
        color: Colors.white,
        fontSize: 55,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
