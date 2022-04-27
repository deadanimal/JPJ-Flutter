import 'package:flutter/material.dart';
import 'package:jpj_info/view/common/color_scheme.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    Key? key,
    this.stateChangeCb,
    this.shadow = const BoxShadow(
      color: Color(0x3f000000),
      blurRadius: 4,
      offset: Offset(0, 4),
    ),
    this.bgColor = Colors.white,
    this.size = 24,
  }) : super(key: key);
  final void Function(bool?)? stateChangeCb;
  final BoxShadow shadow;
  final Color bgColor;
  final double size;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
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
          height: widget.size,
          width: widget.size,
          decoration: BoxDecoration(
            color: widget.bgColor,
            boxShadow: [
              widget.shadow,
            ],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: isChecked
                ? const FittedBox(
                    child: Icon(
                      Icons.check,
                      color: Color(themeNavy),
                    ),
                  )
                : const FittedBox(
                    child: Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.transparent,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
