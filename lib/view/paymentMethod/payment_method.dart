import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/no_trailing_label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    Key? key,
    required this.cardNamecontroller,
    required this.cardNumbercontroller,
    required this.cardExpirycontroller,
    required this.cardCvccontroller,
    required this.submitCallback,
    required this.backCallback,
  }) : super(key: key);

  final TextEditingController cardNamecontroller;
  final TextEditingController cardNumbercontroller;
  final TextEditingController cardExpirycontroller;
  final TextEditingController cardCvccontroller;
  final Function(BuildContext) submitCallback;
  final Function(BuildContext) backCallback;

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
            headerTitle: AppLocalizations.of(context)!.paymentMethod,
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
          _paymentMethods(),
          const SizedBox(height: vPaddingXL),
          _creditCardRadio(context),
          _textField(
            context,
            cardNamecontroller,
            AppLocalizations.of(context)!.cardOwnerName,
            mediaWidth - 64,
          ),
          _textField(
            context,
            cardNumbercontroller,
            AppLocalizations.of(context)!.cardNumber,
            mediaWidth - 64,
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: _textField(
                  context,
                  cardExpirycontroller,
                  AppLocalizations.of(context)!.expiryDate,
                  mediaWidth,
                ),
              ),
              const Spacer(flex: 3),
              Expanded(
                flex: 5,
                child: _textField(
                  context,
                  cardCvccontroller,
                  AppLocalizations.of(context)!.cvc,
                  mediaWidth,
                ),
              ),
            ],
          ),
          CustomButton(
            width: mediaWidth - 64,
            onPressed: () {
              submitCallback(context);
            },
            label: AppLocalizations.of(context)!.verifyPayment,
            decoration: navyGradientBtnDeco,
          ),
          CustomButton(
            width: mediaWidth - 64,
            onPressed: () {
              submitCallback(context);
            },
            label: AppLocalizations.of(context)!.back,
            decoration: whiteBtnDeco,
            textColor: const Color(themeNavy),
          )
        ],
      ),
    );
  }

  Widget _paymentMethods() {
    return Padding(
      padding: const EdgeInsets.only(top: vPaddingXL),
      child: Row(
        children: [
          _paymentMethodIcon("images/paypal_logo.png"),
          _paymentMethodIcon("images/applepay_logo.png"),
          _paymentMethodIcon("images/amazon_logo.png"),
          _paymentMethodIcon("images/google_pay_logo.png"),
        ],
      ),
    );
  }

  Widget _paymentMethodIcon(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(left: vPaddingS, right: vPaddingS),
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Image(
          image: AssetImage(imagePath),
          height: 32,
        ),
      ),
    );
  }

  Widget _creditCardRadio(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.creditCard),
      leading: Radio(
        value: AppLocalizations.of(context)!.creditCard,
        groupValue: AppLocalizations.of(context)!.creditCard,
        onChanged: (String? value) {},
      ),
      trailing: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Image(
              image: AssetImage("images/visa_logo.png"),
              height: 32,
            ),
            Image(
              image: AssetImage("images/mastercard_logo.png"),
              height: 32,
            ),
            Image(
              image: AssetImage("images/american_express_logo.png"),
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField(
    BuildContext context,
    TextEditingController? controller,
    String label,
    double width,
  ) {
    return Column(
      children: [
        const SizedBox(height: vPaddingM),
        CustomNoTrailingLabel(
          label: label,
          fontSize: 15,
          align: TextAlign.start,
          width: width,
        ),
        const SizedBox(height: vPaddingM),
        TextFieldForm(
          textController: controller,
          inputType: TextInputType.emailAddress,
          label: label,
          width: width,
        ),
        const SizedBox(height: vPaddingM),
      ],
    );
  }
}
