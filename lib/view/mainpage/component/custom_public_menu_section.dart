import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/mainpage/component/custom_fav_button.dart';
import 'package:jpj_info/view/mainpage/component/custom_public_button.dart';

class CustomPublicMenuSection extends StatefulWidget {
  const CustomPublicMenuSection({
    Key? key,
    required this.serviceMenu,
    required this.subHeader,
    this.fav = false,
  }) : super(key: key);
  final List<CustomMenuItem> serviceMenu;
  final String subHeader;
  final bool fav;

  @override
  State<StatefulWidget> createState() => _CustomPublicMenuSection();
}

class _CustomPublicMenuSection extends State<CustomPublicMenuSection> {
  final ScrollController sc = ScrollController();
  double _scrollInd = 0;

  @override
  void initState() {
    sc.addListener(() {
      double indOffsetSize = 16;
      setState(() {
        if (sc.position.pixels > sc.position.maxScrollExtent) {
          _scrollInd = indOffsetSize;
        } else if (0 > sc.position.pixels) {
          _scrollInd = 0;
        } else {
          _scrollInd = (sc.position.pixels / sc.position.maxScrollExtent) *
              indOffsetSize;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 12,
      ),
      width: mediaWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: widget.fav
                  ? Badge(
                      badgeContent: const Text(
                        "Top\n5",
                        style: TextStyle(
                          fontSize: 8,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      shape: BadgeShape.square,
                      stackFit: StackFit.passthrough,
                      child: Text(
                        "${widget.subHeader}    ",
                        style: const TextStyle(
                          color: Color(0xff171f44),
                          fontSize: 17,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Text(
                      widget.subHeader,
                      style: const TextStyle(
                        color: Color(0xff171f44),
                        fontSize: 17,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(maxHeight: widget.fav ? 132 : 128),
            width: mediaWidth,
            child: ListView.builder(
              controller: sc,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    widget.fav
                        ? CustomFavButton(menu: widget.serviceMenu[index])
                        : CustomPublicButton(menu: widget.serviceMenu[index]),
                    const SizedBox(width: vPaddingXs),
                  ],
                );
              },
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.serviceMenu.length,
            ),
          ),
          widget.fav ? Container() : const SizedBox(height: verticalPadding),
          Center(
            child: Container(
              height: 4,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFCDCECF),
              ),
              child: Row(
                children: [
                  Container(width: _scrollInd),
                  Container(
                    height: 4,
                    width: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(headerGradient1),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Divider(
              color: Colors.grey,
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
