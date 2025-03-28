import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    Key? key,
    required this.dropdownValue,
    this.cbFunc,
    required this.dropdownList,
    this.width,
  }) : super(key: key);
  final String dropdownValue;
  final dynamic dropdownList;
  final Function? cbFunc;
  final double? width;

  @override
  State<StatefulWidget> createState() => _CustomDropdown();
}

class _CustomDropdown extends State<CustomDropdown> {
  _CustomDropdown();
  late String val;

  @override
  void initState() {
    super.initState();
    val = widget.dropdownValue;
  }

  @override
  void dispose() {
    val = widget.dropdownValue;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widgetWidth = widget.width ?? mediaWidth - 64;

    return SizedBox(
      width: widgetWidth,
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
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              value: val,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              isExpanded: true,
              underline: Container(
                height: 2,
              ),
              onChanged: widget.cbFunc != null
                  ? (String? newValue) {
                      val = newValue!;
                      setState(() {
                        widget.dropdownValue;
                      });
                      widget.cbFunc!(newValue);
                    }
                  : null,
              items: widget.dropdownList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    overflow: TextOverflow.clip,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
