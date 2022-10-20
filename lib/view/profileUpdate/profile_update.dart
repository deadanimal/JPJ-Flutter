import 'package:flutter/material.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/text_field_with_label.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileUpdate extends StatelessWidget {
  const ProfileUpdate({
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

  final void Function(BuildContext) submitCallback;
  final TextEditingController nameTextController;
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
          CustomTextFieldWithLabel(
            controller: nameTextController,
            label: AppLocalizations.of(context)!.fullName,
            readOnly: true,
            width: mediaWidth - 64,
          ),
          CustomTextFieldWithLabel(
            controller: idController,
            label: AppLocalizations.of(context)!.nricNumber,
            readOnly: true,
            width: mediaWidth - 64,
          ),
          CustomTextFieldWithLabel(
            controller: emailController,
            label: AppLocalizations.of(context)!.email,
            readOnly: true,
            width: mediaWidth - 64,
          ),
          const SizedBox(height: vPaddingXXL),
          Center(
            child: Text(
              AppLocalizations.of(context)!.updateProfileInfo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: Color(themeNavy),
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
