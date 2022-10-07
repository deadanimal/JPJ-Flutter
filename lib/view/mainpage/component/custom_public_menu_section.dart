import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
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
      double indOffsetSize = 43;
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
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              padding: const EdgeInsets.only(right: 5, left: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFF9F9F9),
              ),
              child: widget.fav
                  ? Badge(
                      badgeContent: const Text(
                        "Top\n5",
                        style: TextStyle(fontSize: 8),
                        textAlign: TextAlign.center,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      shape: BadgeShape.square,
                      stackFit: StackFit.passthrough,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.subHeader,
                          style: const TextStyle(
                            color: Color(0xff171f44),
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    )
                  : Text(
                      widget.subHeader,
                      style: const TextStyle(
                        color: Color(0xff171f44),
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w900,
                      ),
                    ),
            ),
          ),
          Container(
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(maxHeight: widget.fav ? 110 : 100),
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
          Center(
            child: Container(
              height: 8,
              width: 86,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFCDCECF),
              ),
              child: Row(
                children: [
                  Container(width: _scrollInd),
                  Container(
                    height: 8,
                    width: 43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF37A105),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
