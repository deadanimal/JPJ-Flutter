import 'package:flutter/material.dart';

class TooltipInfo {
  String capitalize(String value) {
    var result = value[0].toUpperCase();
    bool cap = true;
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " " && cap == true) {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
        cap = false;
      }
    }
    return result;
  }

  Future<String?> showInfo(
    BuildContext context,
    String title,
    String info,
    void Function(BuildContext)? callback,
  ) {
    return showDialog<String>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        alignment: Alignment.center,
        content: SingleChildScrollView(
          child: Text(
            info,
            textAlign: TextAlign.center,
          ),
        ),
        title: Text(
          capitalize(title),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'OK');
              callback!(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
