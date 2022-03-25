import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({
    Key? key,
    this.label = "",
    this.width = 64,
    required this.textController,
  }) : super(key: key);

  final String label;
  final double width;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: 4.0,
          shadowColor: Colors.grey,
          child: TextField(
            controller: textController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(
                  color: Colors.orange.shade200,
                ),
              ),
              fillColor: Colors.white,
              label: Center(
                child: Text(label),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
