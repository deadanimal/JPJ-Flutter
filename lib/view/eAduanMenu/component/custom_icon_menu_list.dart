import 'package:flutter/material.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';

class CustomIconMenuButton extends StatelessWidget {
  const CustomIconMenuButton({
    Key? key,
    required this.item,
  }) : super(key: key);
  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    Widget btn = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: mediaWidth - 64,
        constraints: const BoxConstraints(maxWidth: 400),
        child: SizedBox(
          height: 67,
          child: InkWell(
            onTap: () {
              if (item.needLoggedIn && !MyJPJAccountManager().isLoggedIn) {
              } else {
                item.cbFunc!(context);
              }
            },
            child: Stack(
              children: [
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: mediaWidth - 120,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3f000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(
                        left: 50,
                        right: vPaddingXL,
                      ),
                      child: Center(
                        child: Text(
                          item.menu!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(themeNavy),
                            fontSize: 18,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image(
                      alignment: Alignment.centerLeft,
                      image: item.icon!,
                      height: 80,
                    ),
                  ),
                ),
              ],
              // children: [
              //   Image(
              //     alignment: Alignment.centerLeft,
              //     image: item.icon!,
              //     height: 80,
              //   ),
              //   Padding(
              //     padding: const EdgeInsets.only(
              //       top: vPaddingS,
              //       bottom: vPaddingS,
              //     ),
              //     child: Container(
              //       padding: EdgeInsets.all(8.0),
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //         boxShadow: const [
              //           BoxShadow(
              //             color: Color(btnShadow),
              //             blurRadius: 4,
              //             offset: Offset(0, 4),
              //           ),
              //         ],
              //         color: Colors.white,
              //       ),
              //       child: Text(
              //         item.menu!,
              //         textAlign: TextAlign.center,
              //         style: const TextStyle(
              //           color: Color(themeNavy),
              //           fontSize: 18,
              //           fontFamily: "Poppins",
              //           fontWeight: FontWeight.w600,
              //         ),
              //       ),
              //     ),
              //   ),
              // ],
            ),
            // Row(
            //   children: [
            //     Expanded(
            //       // flex: 3,
            //       child: Image(
            //         alignment: Alignment.centerLeft,
            //         image: item.icon!,
            //         height: 80,
            //       ),
            //     ),
            //     Expanded(
            //       flex: 7,
            //       child: Padding(
            //         padding: const EdgeInsets.only(
            //           top: vPaddingS,
            //           bottom: vPaddingS,
            //         ),
            //         child: Container(
            //           padding: EdgeInsets.all(8.0),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             boxShadow: const [
            //               BoxShadow(
            //                 color: Color(btnShadow),
            //                 blurRadius: 4,
            //                 offset: Offset(0, 4),
            //               ),
            //             ],
            //             color: Colors.white,
            //           ),
            //           child: Text(
            //             item.menu!,
            //             textAlign: TextAlign.center,
            //             style: const TextStyle(
            //               color: Color(themeNavy),
            //               fontSize: 18,
            //               fontFamily: "Poppins",
            //               fontWeight: FontWeight.w600,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );

    if (item.needLoggedIn && !MyJPJAccountManager().isLoggedIn) {
      btn = Opacity(
        opacity: 0.45,
        child: btn,
      );
    }
    return btn;
  }
}
