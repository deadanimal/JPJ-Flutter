import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/eHadirCommon/ehadir_add_staff.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EhadirManualRegistration extends StatelessWidget {
  const EhadirManualRegistration({
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
    return EhadirAddStaff(
      submitCallback: submitCallback,
      staffNricController: staffNricController,
      image: const AssetImage("images/icon/ehadir_add_attendee_icon.png"),
      title: AppLocalizations.of(context)!.manualRegistration,
    );
  }
}
