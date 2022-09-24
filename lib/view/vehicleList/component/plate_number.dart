import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';

class PlateNumberContainer extends StatelessWidget {
  const PlateNumberContainer({
    Key? key,
    required this.plateNumber,
    required this.onPressNumber,
  }) : super(key: key);
  final String plateNumber;
  final Function(String) onPressNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          onPressNumber(plateNumber);
        },
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.only(
            bottom: verticalPadding,
            top: verticalPadding,
          ),
          width: mediaWidth - 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: const Color(btnShadow),
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(btnShadow),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
            color: Colors.white,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                plateNumber,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(themeNavy),
                  fontSize: 24,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
