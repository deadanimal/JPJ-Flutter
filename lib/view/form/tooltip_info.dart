import 'package:flutter/material.dart';

class TooltipInfo {
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
          title,
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
