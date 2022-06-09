import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/road_tax_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/id_types.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:jpj_info/view/roadTaxCheck/road_tax_check.dart';

class RoadTaxController extends StatefulWidget {
  const RoadTaxController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RoadTaxController();
}

class _RoadTaxController extends State<RoadTaxController> {
  late TextEditingController _nric;
  late TextEditingController _plateNumber;
  late List<String> dropdownList;
  late String dropdownValue;
  @override
  void initState() {
    super.initState();
    _nric = TextEditingController();

    _nric.text = MyJPJAccountManager().id;
    _plateNumber = TextEditingController();
  }

  @override
  void dispose() {
    _nric.dispose();
    _plateNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dropdownList = getIdType(context);
    dropdownValue = AppLocalizations.of(context)!.malaysian;
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: RoadTaxCheck(
          nric: _nric,
          plateNumber: _plateNumber,
          dropdownList: dropdownList,
          dropdownValue: dropdownValue,
          selectionCallback: _setSelection,
          submitCallback: _submitCallback,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _setSelection(String? newSelection) {
    dropdownValue = newSelection!;
  }

  void _submitCallback(BuildContext context) {
    if (_nric.text.isNotEmpty && _plateNumber.text.isNotEmpty) {
      int index =
          dropdownList.indexWhere((element) => element == dropdownValue);
      RoadTaxRequestController(context, index, _nric.text, _plateNumber.text);
    } else {
      TooltipInfo().showInfo(
        context,
        AppLocalizations.of(context)!.errorPleaseTryAgain,
        AppLocalizations.of(context)!.pleaseFillAllInfo,
        (c) {},
      );
    }
  }
}
