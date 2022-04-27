import 'package:flutter/material.dart';
import 'package:jpj_info/model/jpj_location_response.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:qr_flutter/qr_flutter.dart';

class JpjEqMainPage extends StatelessWidget {
  const JpjEqMainPage({
    Key? key,
    required this.qrData,
    required this.scanQrBtnCallback,
    required this.branchData,
  }) : super(key: key);
  final String qrData;
  final void Function() scanQrBtnCallback;
  final JpjLocationResponseData branchData;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: mediaWidth - 64,
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _header(context),
              const SizedBox(height: vPaddingXL),
              _branchInfo(context),
              const SizedBox(height: vPaddingXL),
              _actionBtn(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.welcomeTo,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w900,
            letterSpacing: 0.36,
            color: Color(btnColor),
          ),
        ),
        const SizedBox(height: vPaddingM),
        Text(
          AppLocalizations.of(context)!.jpjEqTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
            color: Color(btnColor),
          ),
        ),
      ],
    );
  }

  Widget _branchInfo(BuildContext context) {
    return Column(
      children: [
        Text(
          branchData.name!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(btnColor),
            fontSize: 15,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
        QrImage(
          data: qrData,
          version: QrVersions.auto,
          size: 200.0,
        ),
        const SizedBox(height: vPaddingM),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.red,
            ),
            Text(
              branchData.address!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(btnColor),
                fontSize: 12,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _actionBtn(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          width: mediaWidth - 128,
          onPressed: () {},
          decoration: whiteBtnDeco,
          label: AppLocalizations.of(context)!.getLocation,
          textColor: const Color(btnColor),
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage("images/icon/refresh_icon.png"),
            ),
          ),
        ),
        const SizedBox(height: vPaddingM),
        CustomButton(
          onPressed: () => scanQrBtnCallback(),
          decoration: navyGradientBtnDeco,
          label: AppLocalizations.of(context)!.scanQrCode,
          width: mediaWidth - 128,
        ),
        const SizedBox(height: vPaddingM),
        const Text(
          "16:19:11",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff171f44),
            fontSize: 40,
          ),
        )
      ],
    );
  }
}
