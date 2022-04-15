import 'package:flutter/material.dart';
import 'package:jpj_info/controller/responsive.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/no_trailing_label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileUpdate extends StatelessWidget {
  ProfileUpdate({
    Key? key,
    required this.nameTextController,
    required this.emailController,
    required this.idController,
    required this.phoneController,
    required this.addressController,
    required this.districtController,
    required this.stateController,
    required this.postcodeController,
    required this.submitCallback,
  }) : super(key: key);

  late void Function(BuildContext) submitCallback;
  late TextEditingController nameTextController;
  final TextEditingController emailController;
  final TextEditingController idController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController districtController;
  final TextEditingController stateController;
  final TextEditingController postcodeController;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return _showUpdateProfilePage(context);
  }

  Widget _showUpdateProfilePage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.updateNProfile,
          ),
          _form(context),
        ],
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Container(
      width: mediaWidth - 64,
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: vPaddingXL),
          _textField(
            context,
            nameTextController,
            AppLocalizations.of(context)!.fullName,
            true,
            mediaWidth - 64,
          ),
          _textField(
            context,
            idController,
            AppLocalizations.of(context)!.nricNumber,
            true,
            mediaWidth - 64,
          ),
          _textField(
            context,
            phoneController,
            AppLocalizations.of(context)!.phoneNumber,
            false,
            mediaWidth - 64,
          ),
          _textField(
            context,
            emailController,
            AppLocalizations.of(context)!.email,
            MyJPJAccountManager().type == userType.staff ? false : true,
            mediaWidth - 64,
          ),
          _textField(
            context,
            addressController,
            AppLocalizations.of(context)!.address,
            true,
            mediaWidth - 64,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: _textField(
                  context,
                  districtController,
                  AppLocalizations.of(context)!.district,
                  true,
                  mediaWidth,
                ),
              ),
              Expanded(
                flex: 5,
                child: _textField(
                  context,
                  stateController,
                  AppLocalizations.of(context)!.state,
                  true,
                  mediaWidth,
                ),
              ),
            ],
          ),
          _textField(
            context,
            postcodeController,
            AppLocalizations.of(context)!.postcode,
            true,
            ((Responsive().isMobile(context) ? mediaWidth : 400) / 2) - 64,
          ),
          const SizedBox(height: vPaddingXL),
          CustomButton(
            width: mediaWidth - 64,
            onPressed: () => submitCallback(context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Color(btnShadow),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
              color: const Color(btnColor),
            ),
            label: AppLocalizations.of(context)!.submit,
          ),
        ],
      ),
    );
  }

  Widget _textField(
    BuildContext context,
    TextEditingController controller,
    String label,
    bool readOnly,
    double width,
  ) {
    return Column(
      children: [
        CustomNoTrailingLabel(
          label: label,
          fontSize: 15,
          align: TextAlign.start,
          width: width,
        ),
        const SizedBox(height: vPaddingS),
        TextFieldForm(
          textColor: readOnly ? Colors.grey : Colors.black,
          textController: controller,
          readOnly: readOnly,
          inputType: TextInputType.emailAddress,
          label: label,
          width: width,
        ),
        const SizedBox(height: vPaddingM),
      ],
    );
  }
}
