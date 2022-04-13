import 'package:flutter/material.dart';
import 'package:jpj_info/model/summons_response.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/checkbox.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomExpandableContainer extends StatefulWidget {
  const CustomExpandableContainer({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Summons data;

  @override
  State<CustomExpandableContainer> createState() =>
      _CustomExpandableContainer();
}

class _CustomExpandableContainer extends State<CustomExpandableContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(boxShadow),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildPanel(context),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: vPaddingM,
        bottom: vPaddingM,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: CustomCheckbox(
              bgColor: Colors.grey.shade50,
              shadow: const BoxShadow(),
              size: 18,
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.vehicleRegistration!,
                  style: const TextStyle(
                    color: Color(0xff354c96),
                    fontSize: 24,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.data.summonsId!,
                  style: const TextStyle(
                    color: Color(0xff8b9eb0),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPanel(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        title: _title(context),
        children: <Widget>[
          _expandedContent(context),
        ],
      ),
    );
  }

  Widget _expandedContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _summonInfo(context),
        _paymentStatus(context),
      ],
    );
  }

  Widget _summonInfo(BuildContext context) {
    return Column(
      children: [
        _summonDetail(
          context,
          AppLocalizations.of(context)!.offense,
          widget.data.offense!,
          false,
        ),
        _summonDetail(
          context,
          AppLocalizations.of(context)!.ticketNo,
          widget.data.summonsId!,
          false,
        ),
        _summonDetail(
          context,
          AppLocalizations.of(context)!.date,
          widget.data.date!,
          false,
        ),
        _summonDetail(
          context,
          AppLocalizations.of(context)!.location,
          widget.data.location!,
          false,
        ),
        _summonDetail(
          context,
          AppLocalizations.of(context)!.amount,
          widget.data.amount!,
          true,
        ),
      ],
    );
  }

  Widget _summonDetail(
    BuildContext context,
    String label,
    String detail,
    bool amountField,
  ) {
    return Row(
      children: [
        _summonInfoLabel(context, label),
        amountField == true
            ? _summonInfoDetail(
                context,
                detail,
                textColor: const Color(errorRed),
                fontWeight: FontWeight.w600,
              )
            : _summonInfoDetail(context, detail),
      ],
    );
  }

  Widget _summonInfoLabel(
    BuildContext context,
    String label, {
    Color textColor = const Color(0xff2e2e2e),
  }) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _summonInfoDetail(
    BuildContext context,
    String detail, {
    Color textColor = const Color(0xff2e2e2e),
    FontWeight? fontWeight,
  }) {
    return Expanded(
      flex: 7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Text(
            detail,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }

  Widget _paymentStatus(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(vPaddingM),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        color: Color(errorRed),
      ),
      child: Text(
        AppLocalizations.of(context)!.paymentInProcess,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
