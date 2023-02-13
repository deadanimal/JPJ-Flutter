import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/header.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';

class JpjEqHomepage extends StatelessWidget {
  const JpjEqHomepage({
    Key? key,
    required this.getLocation,
    required this.scanBtnCallback,
  }) : super(key: key);

  final Function getLocation;
  final Function scanBtnCallback;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Column(
      children: [
        const EqHeader(),
        Expanded(
          child: ListView(
            children: [
              _body(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      width: mediaWidth - 64,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _title(context),
            const SizedBox(height: 24),
            _locationInfo(context),
            const SizedBox(height: 24),
            _qrCode(context),
            const SizedBox(height: 24),
            _scanButton(context),
            const SizedBox(height: 24),
            _textInfo(context),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Center(
      child: SizedBox(
        width: mediaWidth / 1.5,
        child: Text(
          AppLocalizations.of(context)!.jpjEqTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(eqThemeNavy),
            fontSize: 18,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _locationInfo(BuildContext context) {
    return RoundedCornerContainer(
      cornerRadius: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: const [
                Text(
                  "Lokasi Anda",
                  style: TextStyle(
                    color: Color(eqThemeNavy),
                    fontSize: 15,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Jalan Teknokrat 5 Cyberjaya",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Color(eqThemeNavy),
                      fontSize: 15,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  AppLocalizations.of(context)!.nearestBranch,
                  style: const TextStyle(
                    color: Color(eqThemeNavy),
                    fontSize: 15,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    "JPJ Negeri Johor",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Color(eqThemeNavy),
                      fontSize: 15,
                      fontFamily: "Roboto",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: () {
                getLocation();
              },
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: const Color(eqThemeNavy),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Dapatkan Lokasi"),
                      SizedBox(width: 8),
                      Icon(Icons.refresh),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _qrCode(BuildContext context) {
    return SizedBox(
      width: mediaWidth - 128,
      child: const Image(
        image: AssetImage("images/jpjeq/qr-code.png"),
      ),
    );
  }

  Widget _scanButton(BuildContext context) {
    return InkWell(
      onTap: () {
        scanBtnCallback();
      },
      child: Container(
        width: mediaWidth - 128,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
          color: Color(eqThemeNavy),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            AppLocalizations.of(context)!.scanQrCode,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _textInfo(BuildContext context) {
    return RoundedCornerContainer(
      cornerRadius: 8,
      width: mediaWidth,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(AppLocalizations.of(context)!.eqInfoMainPage),
      ),
    );
  }
}
