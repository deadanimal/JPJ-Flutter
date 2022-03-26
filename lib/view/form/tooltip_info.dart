import 'package:flutter/material.dart';

class TooltipInfo {
  Future<String?> showInfo(
    BuildContext context,
    String title,
    String info,
    void Function(BuildContext)? callback,
  ) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        alignment: Alignment.center,
        content: Text(
          info,
          textAlign: TextAlign.center,
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
