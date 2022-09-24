import 'package:flutter/material.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/mainpage/component/custom_public_button.dart';

class CustomPublicMenuSection extends StatelessWidget {
  const CustomPublicMenuSection({
    Key? key,
    required this.serviceMenu,
    required this.subHeader,
  }) : super(key: key);
  final List<CustomMenuItem> serviceMenu;
  final String subHeader;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 12,
        bottom: 16,
      ),
      constraints: const BoxConstraints(maxWidth: 400),
      width: mediaWidth - 32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xff848484),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subHeader,
            style: const TextStyle(
              color: Color(0xff171f44),
              fontSize: 15,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: vPaddingM),
          Container(
            constraints: const BoxConstraints(maxHeight: 130),
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 12),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomPublicButton(menu: serviceMenu[index]);
              },
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: serviceMenu.length,
            ),
          ),
        ],
      ),
    );
  }
}
