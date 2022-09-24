import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/id_types.dart';
import 'package:jpj_info/model/expansion_list.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:jpj_info/view/profileUpdate/profile_update.dart';

class ProfileUpdateController extends StatefulWidget {
  const ProfileUpdateController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileUpdateController();
}

class _ProfileUpdateController extends State<ProfileUpdateController> {
  late TextEditingController _namecontroller;
  late TextEditingController _emailController;
  late TextEditingController _idController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _districtController;
  late TextEditingController _stateController;
  late TextEditingController _postcodeController;
  late List<String> dropdownList;
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    _namecontroller = TextEditingController();
    _emailController = TextEditingController();
    _idController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _districtController = TextEditingController();
    _stateController = TextEditingController();
    _postcodeController = TextEditingController();

    _namecontroller.text = MyJPJAccountManager().name;
    _idController.text = MyJPJAccountManager().id;
    _phoneController.text = MyJPJAccountManager().phoneNumber;
    _emailController.text = MyJPJAccountManager().email;
    _addressController.text = MyJPJAccountManager().address;
    _districtController.text = MyJPJAccountManager().district;
    _stateController.text = MyJPJAccountManager().state;
    _postcodeController.text = MyJPJAccountManager().postcode;
  }

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailController.dispose();
    _idController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _districtController.dispose();
    _stateController.dispose();
    _postcodeController.dispose();
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
        body: ProfileUpdate(
          submitCallback: _submitCallback,
          nameTextController: _namecontroller,
          addressController: _addressController,
          districtController: _districtController,
          emailController: _emailController,
          idController: _idController,
          phoneController: _phoneController,
          postcodeController: _postcodeController,
          stateController: _stateController,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _submitCallback(BuildContext context) {
    // todo: save data to cloud
    MyJPJAccountManager().phoneNumber = _phoneController.text;
    MyJPJAccountManager().email = _emailController.text;
    TooltipInfo().showInfo(
      context,
      AppLocalizations.of(context)!.yourProfile,
      AppLocalizations.of(context)!.successfullyUpdated,
      (c) => _onCloseSubmitInfo(c),
    );
  }

  void _onCloseSubmitInfo(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const MainpageController();
        },
      ),
    );
  }
}
