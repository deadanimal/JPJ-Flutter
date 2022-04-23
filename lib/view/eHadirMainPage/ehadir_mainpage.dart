import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EhadirMainPage extends StatelessWidget {
  const EhadirMainPage({
    Key? key,
    required this.qrData,
    required this.staffName,
    required this.nric,
    required this.scanQrBtnCallback,
  }) : super(key: key);
  final String qrData;
  final String staffName;
  final String nric;
  final void Function() scanQrBtnCallback;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Center(
      child: RoundedCornerContainer(
        width: mediaWidth - 64,
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _heading(context),
            const SizedBox(height: vPaddingM),
            _qrCode(),
            const SizedBox(height: vPaddingM),
            _staffInfoField(context),
            const SizedBox(height: vPaddingM),
            CustomButton(
              width: 200,
              onPressed: scanQrBtnCallback,
              decoration: navyGradientBtnDecoSquare,
              label: AppLocalizations.of(context)!.scanQrCode,
            ),
            const SizedBox(height: vPaddingM),
          ],
        ),
      ),
    );
  }

  Widget _heading(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xff171f44), Color(0xff2b388d)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          AppLocalizations.of(context)!.staffDetail,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
            letterSpacing: 0.50,
          ),
        ),
      ),
    );
  }

  Widget _qrCode() {
    return QrImage(
      data: "1234567890",
      version: QrVersions.auto,
      size: 200.0,
    );
  }

  Widget _staffInfoField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _textField(AppLocalizations.of(context)!.name, staffName),
          _textField(AppLocalizations.of(context)!.nokpSection, nric),
        ],
      ),
    );
  }

  Widget _textField(String label, String content) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text(
            ":",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Text(
            content,
            style: const TextStyle(
              color: Color(0xff2e2e2e),
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
