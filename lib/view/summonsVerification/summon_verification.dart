import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/dropdown.dart';
import 'package:jpj_info/view/summonsVerification/component/bordered_container.dart';
import 'package:jpj_info/view/summonsVerification/component/ticket_container.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SummonsVerification extends StatelessWidget {
  const SummonsVerification({
    Key? key,
    required this.submitCallback,
  }) : super(key: key);
  final void Function(BuildContext) submitCallback;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return _showPageContent(context);
  }

  Widget _showPageContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.summonsVerification,
          ),
          _contentContainer(context),
        ],
      ),
    );
  }

  Widget _contentContainer(BuildContext context) {
    return Container(
      width: mediaWidth - 64,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          CustomBorderedContainer(
            width: mediaWidth - 64,
            child: const CustomTicketContainer(
              amount: "300.00",
              date: "04/05/2021",
              details: "Motorsikal Tidak Menyalakan lampu setiap masa",
              ticketNo: "98483958465697NOSAMAN0023",
              time: "10:44 AM",
              vehicleNo: "VAR3428",
            ),
          ),
          const SizedBox(height: vPaddingXL),
          _label(AppLocalizations.of(context)!.summary),
          CustomBorderedContainer(
            width: mediaWidth - 128,
            child: _summary(context),
          ),
          const SizedBox(height: vPaddingXL),
          _label(AppLocalizations.of(context)!.payment),
          const SizedBox(height: vPaddingM),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.choosePaymentMethod,
              style: const TextStyle(
                color: Color(0xff2b388d),
                fontSize: 13,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          CustomDropdown(
            dropdownValue: AppLocalizations.of(context)!.paymentMode,
            cbFunc: () {},
            dropdownList: [
              AppLocalizations.of(context)!.paymentMode,
              "Credit Card",
            ],
          ),
          const SizedBox(height: vPaddingM),
          CustomDropdown(
            dropdownValue: AppLocalizations.of(context)!.cardType,
            cbFunc: () {},
            dropdownList: [
              AppLocalizations.of(context)!.cardType,
              "Credit Card",
            ],
          ),
          const SizedBox(height: vPaddingM),
          CustomButton(
            width: mediaWidth - 64,
            onPressed: () {
              submitCallback(context);
            },
            decoration: navyGradientBtnDeco,
            label: AppLocalizations.of(context)!.paySummon,
          ),
        ],
      ),
    );
  }

  Widget _label(String label) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xff171f44),
          fontSize: 18,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w600,
          letterSpacing: 0.63,
        ),
      ),
    );
  }

  Widget _summary(BuildContext context) {
    return Column(
      children: [
        _summaryContent(
          context,
          AppLocalizations.of(context)!.summonCount,
          "1",
        ),
        _summaryContent(
          context,
          AppLocalizations.of(context)!.amountDue,
          "RM300.00",
        ),
      ],
    );
  }

  Widget _summaryContent(BuildContext context, String label, String content) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(vPaddingM),
            child: Text(
              label,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xff2e2e2e),
                fontSize: 12,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(
              vPaddingM,
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: vPaddingM),
              child: Text(
                content,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
