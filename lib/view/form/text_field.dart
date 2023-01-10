import 'package:flutter/material.dart';

class TextFieldForm extends StatelessWidget {
  const TextFieldForm({
    Key? key,
    this.label = "",
    this.width = 64,
    this.obscureText = false,
    this.readOnly = false,
    this.inputType = TextInputType.text,
    this.textController,
    this.maxLines = 1,
    this.minLines,
    this.textColor = Colors.black,
    this.maxLength,
    this.onTap,
  }) : super(key: key);

  final String label;
  final double width;
  final TextInputType inputType;
  final bool obscureText;
  final bool readOnly;
  final TextEditingController? textController;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Function()? onTap;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          elevation: 4.0,
          shadowColor: Colors.grey,
          child: TextField(
            onTap: onTap,
            enabled: !readOnly ? true : false,
            style: TextStyle(color: !readOnly ? textColor : Colors.grey),
            maxLength: maxLength,
            readOnly: readOnly,
            minLines: minLines,
            maxLines: maxLines,
            controller: textController,
            textAlign: TextAlign.center,
            keyboardType: inputType,
            obscureText: obscureText,
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
              hintText: label,
            ),
          ),
        ),
      ),
    );
  }
}
