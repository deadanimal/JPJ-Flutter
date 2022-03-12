import 'package:flutter/material.dart';
import 'package:jpj_info/view/license/license.dart';

void licensePage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const License();
      },
    ),
  );
}
