import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/header.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';
import 'package:jpj_info/view/common/spacing.dart';

class JpjEqHomepage extends StatelessWidget {
  const JpjEqHomepage({
    Key? key,
    required this.getLocation,
    required this.scanBtnCallback,
    required this.locationName,
    required this.nearestBranch,
    required this.waitingTime,
  }) : super(key: key);

  final Function getLocation;
  final Function scanBtnCallback;
  final String locationName;
  final String nearestBranch;
  final Duration? waitingTime;

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
              children: [
                Text(
                  AppLocalizations.of(context)!.yourLocation,
                  style: const TextStyle(
                    color: Color(eqThemeNavy),
                    fontSize: 15,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 12),
                locationName != ''
                    ? Expanded(
                        child: Text(
                          locationName,
                          maxLines: 2,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            color: Color(eqThemeNavy),
                            fontSize: 15,
                            fontFamily: "Roboto",
                          ),
                        ),
                      )
                    : const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(),
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
                nearestBranch != ''
                    ? Expanded(
                        child: Text(
                          nearestBranch,
                          maxLines: 2,
                          textAlign: TextAlign.end,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            color: Color(eqThemeNavy),
                            fontSize: 15,
                            fontFamily: "Roboto",
                          ),
                        ),
                      )
                    : const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
            const SizedBox(height: 12),
            locationName != ''
                ? InkWell(
                    onTap: () {
                      if (locationName != '') {
                        getLocation();
                      }
                    },
                    child: Container(
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color: const Color(eqThemeNavy),
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppLocalizations.of(context)!.getLocation),
                            const SizedBox(width: 8),
                            const Icon(Icons.refresh),
                          ],
                        ),
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator(),
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
    if (waitingTime == null) {
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
    } else {
      return Column(
        children: [
          Text(
            AppLocalizations.of(context)!.scanQrIn,
            style: const TextStyle(
              color: Color(0xffce6774),
            ),
          ),
          const SizedBox(
            height: vPaddingS,
          ),
          Container(
            width: mediaWidth - 128,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
              color: Color(0xfffcf0f2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "${waitingTime!.inMinutes} ${AppLocalizations.of(context)!.minutes} ${waitingTime!.inSeconds} ${AppLocalizations.of(context)!.seconds}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xffce6774),
                  fontSize: 18,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      );
    }
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
