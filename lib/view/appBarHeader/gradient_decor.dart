import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

const BoxDecoration customGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [Color(headerGradient1), Color(headerGradient2)],
  ),
);
