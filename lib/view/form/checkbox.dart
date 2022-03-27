import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class CustomCheckbox extends StatefulWidget {
  CustomCheckbox({
    Key? key,
    this.stateChangeCb,
  }) : super(key: key);
  void Function(bool?)? stateChangeCb;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return const Color(themeNavy);
    }

    return Center(
        child: InkWell(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
        if (widget.stateChangeCb != null) {
          widget.stateChangeCb!(isChecked);
        }
      },
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: isChecked
              ? const Icon(
                  Icons.check,
                  // size: 30.0,
                  color: Color(themeNavy),
                )
              : const Icon(
                  Icons.check_box_outline_blank,
                  // size: 30.0,
                  color: Colors.transparent,
                ),
        ),
      ),
    ));

    return Checkbox(
      shape: CircleBorder(side: BorderSide.none),
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        if (widget.stateChangeCb != null) {
          widget.stateChangeCb!(value);
        }
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
