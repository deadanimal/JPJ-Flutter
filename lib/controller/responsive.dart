import 'package:flutter/material.dart';

class Responsive {
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 820;

  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 820;

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}
