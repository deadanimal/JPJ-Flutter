import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class TemplateForm {
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
    return SizedBox(
      width: mediaWidth - 64,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
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

  Widget idNumber(
      TextEditingController? nricTextController, textInput, cbFunc) {
    return SizedBox(
      width: mediaWidth - 64,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.circular(8),
          elevation: 16.0,
          shadowColor: Colors.grey,
          child: TextField(
            controller: nricTextController,
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

  Widget plateNumber(
      TextEditingController? plateTextController, textInput, cbFunc) {
    if (plateTextController != null) {
      return SizedBox(
        width: mediaWidth - 64,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            borderRadius: BorderRadius.circular(8),
            elevation: 16.0,
            shadowColor: Colors.grey,
            child: TextField(
              controller: plateTextController,
              onSubmitted: (String value) {
                cbFunc();
              },
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                labelText: 'Plate Number',
              ),
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: mediaWidth - 64,
      );
    }
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

  Future<void> connectionError(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text('Connection Error!'),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Center(
                  child: Text('Please try again.'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
