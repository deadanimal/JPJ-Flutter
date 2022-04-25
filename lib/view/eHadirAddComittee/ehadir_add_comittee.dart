import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/no_trailing_label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EhadirAddComitee extends StatelessWidget {
  const EhadirAddComitee({
    Key? key,
    required this.submitCallback,
    required this.staffNricController,
  }) : super(key: key);
  final Function submitCallback;
  final TextEditingController staffNricController;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Center(
      child: Container(
        width: mediaWidth,
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Image(
              image: AssetImage("images/icon/ehadir_add_comittee_icon.png"),
            ),
            const SizedBox(height: vPaddingM),
            _textField(
              context,
              staffNricController,
              AppLocalizations.of(context)!.nricNumber,
              mediaWidth - 64,
            ),
            const SizedBox(height: vPaddingXL),
            Center(
              child: CustomButton(
                width: mediaWidth - 128,
                onPressed: () {
                  submitCallback(context);
                },
                decoration: navyGradientBtnDeco,
                label: AppLocalizations.of(context)!.submit,
              ),
            ),
            const SizedBox(height: vPaddingXXL),
          ],
        ),
      ),
    );
  }

  Widget _textField(
    BuildContext context,
    TextEditingController controller,
    String label,
    double width,
  ) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNoTrailingLabel(
            label: label,
            fontSize: 15,
            align: TextAlign.start,
            width: width,
          ),
          const SizedBox(height: vPaddingS),
          TextFieldForm(
            textColor: Colors.black,
            textController: controller,
            readOnly: false,
            inputType: TextInputType.emailAddress,
            label: label,
            width: width,
          ),
          const SizedBox(height: vPaddingS),
          Text(
            AppLocalizations.of(context)!.addComitteeInfo,
            style: const TextStyle(
              color: Color(0xff707070),
              fontSize: 8,
            ),
          ),
          const SizedBox(height: vPaddingM),
        ],
      ),
    );
  }
}
