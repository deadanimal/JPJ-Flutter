import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class UiElement {
  var dropdownCbFunction;
  var dropdownValues;
  var dropdownList;
  var textController;
  var textInput;
  var submitCB;

  UiElement({
    this.dropdownCbFunction,
    this.dropdownValues,
    this.dropdownList,
    this.textController,
    this.textInput,
    this.submitCB,
  });
}

class TemplateForm {
  late String headerTitle;

  void setHeader(String title) {
    headerTitle = title;
  }

  Widget header() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(boxShadow),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(heederGradient1), Color(heederGradient2)],
        ),
      ),
      padding: const EdgeInsets.only(
        left: 4,
        right: 4,
        top: 8,
        bottom: 8,
      ),
      child: title(),
    );
  }

  Widget title() {
    return Container(
      width: mediaWidth,
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: Text(
        headerTitle,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 55,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget label() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Kategori",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color(0xff171f44),
          fontSize: 18,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          letterSpacing: 0.63,
        ),
      ),
    );
  }

  Widget dropdownSelector(cbFunc, dropdownValue, dropdownList) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mediaWidth - 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(btnShadow),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            underline: Container(
              height: 2,
            ),
            onChanged: (String? newValue) {
              cbFunc(newValue!);
            },
            items: dropdownList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget idNumber(TextEditingController textController, textInput, cbFunc) {
    return SizedBox(
      width: mediaWidth - 64,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          elevation: 16.0,
          shadowColor: Colors.grey,
          child: TextField(
            controller: textController,
            onSubmitted: (String value) {
              cbFunc();
            },
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              labelText: 'ID',
            ),
          ),
        ),
      ),
    );
  }

  Widget submitBtn(cbFunc) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: mediaWidth - 128,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(btnShadow),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          color: const Color(btnColor),
        ),
        padding: const EdgeInsets.all(8),
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: cbFunc,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                "Hantar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
