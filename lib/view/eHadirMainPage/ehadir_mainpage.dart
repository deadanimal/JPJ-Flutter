import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class EhadirMainPage extends StatelessWidget {
  const EhadirMainPage({
    Key? key,
    required this.qrData,
    required this.staffName,
    required this.nric,
    required this.scanQrBtnCallback,
    required this.activityBtnCb,
    required this.comiteeBtnCb,
  }) : super(key: key);
  final String qrData;
  final String staffName;
  final String nric;
  final void Function() scanQrBtnCallback;
  final void Function() activityBtnCb;
  final void Function() comiteeBtnCb;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return ListView(
      children: [
        const TemplateHeader(
          headerTitle: "JPJeHadir",
          headerTitleFontSize: 48,
        ),
        const SizedBox(
          height: vPaddingXL,
        ),
        Center(
          child: RoundedCornerContainer(
            cornerRadius: 5,
            width: mediaWidth - 64,
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _heading(context),
                const SizedBox(height: vPaddingM),
                _qrCode(),
                const SizedBox(height: vPaddingM),
                // _staffInfoField(context),
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
        ),
        const SizedBox(height: vPaddingXL),
        menuButton(
          AppLocalizations.of(context)!.activity,
          const AssetImage("images/icon/ehadir/ehadir_main_icon_activity.png"),
          activityBtnCb,
        ),
        const SizedBox(height: verticalPadding),
        menuButton(
          AppLocalizations.of(context)!.comittee,
          const AssetImage("images/icon/ehadir/ehadir_main_icon_comitee.png"),
          comiteeBtnCb,
        ),
        const SizedBox(height: vPaddingXL),
      ],
    );
  }

  Widget menuButton(String label, AssetImage icon, Function() cb) {
    return InkWell(
      onTap: cb,
      child: Center(
        child: RoundedCornerContainer(
          width: mediaWidth - 64,
          cornerRadius: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image(
                  image: icon,
                  height: 48,
                ),
                const SizedBox(
                  width: vPaddingXL,
                ),
                Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(themeNavy),
                      fontSize: 18,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  width: vPaddingXXL,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _heading(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
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
            fontFamily: "Roboto",
            fontWeight: FontWeight.w600,
            letterSpacing: 0.50,
          ),
        ),
      ),
    );
  }

  Widget _qrCode() {
    return PrettyQr(
      image: const AssetImage("images/icon/jpjehadir.png"),
      size: 150,
      data: qrData,
      errorCorrectLevel: QrErrorCorrectLevel.M,
      roundEdges: true,
      elementColor: const Color(themeNavy),
    );
  }
}
