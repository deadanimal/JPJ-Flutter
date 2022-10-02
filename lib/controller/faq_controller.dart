import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class FaqController extends StatefulWidget {
  const FaqController({Key? key, required this.doc}) : super(key: key);
  final PDFDocument doc;

  @override
  State<StatefulWidget> createState() => _FaqController();
}

class _FaqController extends State<FaqController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
      ),
      body: Center(child: PDFViewer(document: widget.doc)),
    );
  }
}
