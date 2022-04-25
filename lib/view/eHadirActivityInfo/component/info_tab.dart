import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/summonsVerification/component/bordered_container.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InfoTab extends StatelessWidget {
  const InfoTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBorderedContainer(
      width: mediaWidth,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "HARI KONVENSYEN JPJ MALAYSIA 2022",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(btnColor),
                fontSize: 35,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: vPaddingXL),
            QrImage(
              data: "1234567890",
              version: QrVersions.auto,
              size: 200.0,
            ),
            const SizedBox(height: vPaddingXL),
            const Text(
              "Dewan Serbaguna MOT\nMAC 22 2022 - MAC 23 2022\nSESI 1 07:00:00 - 17:00:00",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
