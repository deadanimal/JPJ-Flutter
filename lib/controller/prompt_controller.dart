import 'package:flutter/material.dart';

class PromptController {
  BuildContext ctx;
  PromptController({required this.ctx});

  Future<void> prompt(String label, Function okCB, Function cancelCB) {
    return showDialog<void>(
      context: ctx,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(label),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                okCB();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                cancelCB();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
