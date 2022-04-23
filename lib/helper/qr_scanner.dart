import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScanner extends StatelessWidget {
  const QrScanner({
    Key? key,
    required this.qrScanCallback,
  }) : super(key: key);
  final Function(Barcode) qrScanCallback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Scanner')),
      body: MobileScanner(
          allowDuplicates: false,
          onDetect: (barcode, args) {
            qrScanCallback(barcode);
          }),
    );
  }
}
