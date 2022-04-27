import 'package:flutter/material.dart';
import 'package:jpj_info/model/jpj_eq_operating_hour.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/summonsVerification/component/bordered_container.dart';

class JpjEqOperatingHour extends StatelessWidget {
  const JpjEqOperatingHour({
    Key? key,
    required this.hours,
    required this.backBtnCallback,
  }) : super(key: key);
  final List<JpjBranchOperatingHour> hours;
  final Function(BuildContext) backBtnCallback;

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
            children: [
              const Image(
                image: AssetImage("images/jpjeq_people_at_counter.png"),
              ),
              _warning(context),
              const SizedBox(height: vPaddingXL),
              _operatingHourTable(context),
              const SizedBox(height: vPaddingXL),
              CustomButton(
                onPressed: () {
                  backBtnCallback(context);
                },
                decoration: navyGradientBtnDeco,
                label: AppLocalizations.of(context)!.back,
                width: mediaWidth - 128,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _warning(BuildContext context) {
    return CustomBorderedContainer(
      width: mediaWidth - 64,
      decoration: redGradientBtnDeco,
      child: Text(
        AppLocalizations.of(context)!.scanQrInPermittedTime,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _operatingHourTable(BuildContext context) {
    return RoundedCornerContainer(
      width: mediaWidth - 64,
      child: Column(
        children: [
          _tableHeader(context),
          _tableSubheader(context),
          _tableContent(context),
        ],
      ),
    );
  }

  Widget _tableHeader(BuildContext context) {
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
          colors: [Color(headerGradient1), Color(headerGradient2)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          AppLocalizations.of(context)!.operationHour,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 1.25,
          ),
        ),
      ),
    );
  }

  Widget _tableSubheader(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              AppLocalizations.of(context)!.day,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const VerticalDivider(
            thickness: 1,
            width: 20,
            endIndent: 2,
            indent: 2,
            color: Colors.grey,
          ),
          Expanded(
            flex: 3,
            child: Text(
              AppLocalizations.of(context)!.start,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              AppLocalizations.of(context)!.end,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tableContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: hours.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(height: verticalPadding),
              _tableContentItem(
                context,
                hours[index],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _tableContentItem(
      BuildContext context, JpjBranchOperatingHour opHour) {
    if (!opHour.close) {
      return IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                opHour.day,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const VerticalDivider(
              thickness: 1,
              width: 20,
              endIndent: 2,
              indent: 2,
              color: Colors.grey,
            ),
            Expanded(
              flex: 3,
              child: Text(
                opHour.start!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                opHour.end!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                opHour.day,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const VerticalDivider(
              thickness: 1,
              width: 20,
              endIndent: 2,
              indent: 2,
              color: Colors.grey,
            ),
            Expanded(
              flex: 6,
              child: Text(
                AppLocalizations.of(context)!.closed,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
