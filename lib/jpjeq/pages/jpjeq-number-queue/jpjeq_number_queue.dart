import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/header.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JpjEqNumberQueue extends StatelessWidget {
  const JpjEqNumberQueue({
    Key? key,
  }) : super(key: key);

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
      width: mediaWidth,
      child: Column(
        children: [
          const SizedBox(height: 8),
          _title(context),
          const SizedBox(height: 24),
          _branchInfo(context),
          const SizedBox(height: 24),
          _queueNumber(context),
          const SizedBox(height: 24),
          _queueInfo(context),
          const SizedBox(height: 24),
          _cancelButton(context),
          const SizedBox(height: 24),
          _footerNote(context),
        ],
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

  Widget _branchInfo(BuildContext context) {
    return Container(
      width: mediaWidth,
      color: const Color(eqThemeNavy),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "JPJ CAWANGAN JEMPOL (Bawah)",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "30 JAN 2023",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.amber,
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "Sesi 1 - 16:00:00 - 22:00:00",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _queueNumber(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.yourQNumber,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Color(eqThemeNavy),
          ),
        ),
        const Text(
          '6001',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 64,
            color: Color(eqThemeNavy),
            fontFamily: "Poppins",
          ),
        ),
      ],
    );
  }

  Widget _infoHeader(String headerText) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: Color(eqThemeNavy),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SizedBox(
            height: 86,
            child: Text(
              headerText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoContent(String headerText) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        border: Border.all(color: Colors.grey.shade300),
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: 86,
            child: Text(
              headerText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _queueInfo(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _infoHeader(AppLocalizations.of(context)!.latestNQNumber),
            ),
            Expanded(
              child: _infoHeader(AppLocalizations.of(context)!.waitingPosition),
            ),
            Expanded(
              child:
                  _infoHeader(AppLocalizations.of(context)!.estimatedWaitTime),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: _infoContent(''),
            ),
            Expanded(
              child: _infoContent('1'),
            ),
            Expanded(
              child: _infoContent('2\nMinit'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _cancelButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: mediaWidth / 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
            child: Row(
              children: [
                const Icon(
                  Icons.cancel_outlined,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.cancelB,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _footerNote(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.thankyouForYourPatientWaiting,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
