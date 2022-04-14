import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/jpj_location_response.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/dropdown.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maps_launcher/maps_launcher.dart';

class JpjDirectoryInfo extends StatefulWidget {
  const JpjDirectoryInfo({
    Key? key,
    required this.data,
    required this.stateFlag,
    required this.stateName,
  }) : super(key: key);
  final List<JpjLocationResponseData> data;
  final AssetImage stateFlag;
  final String stateName;

  @override
  State<StatefulWidget> createState() => _JpjDirectoryInfo();
}

class _JpjDirectoryInfo extends State<JpjDirectoryInfo> {
  late JpjLocationResponseData locationData;
  late List<String> dropdownList;
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    locationData = widget.data[0];
    dropdownList = [];
    for (var branchInfo in widget.data) {
      dropdownList.add(branchInfo.name!);
    }
    dropdownValue = dropdownList[0];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: showTestResultPage(context),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  Widget showTestResultPage(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: AppLocalizations.of(context)!.directoryN,
            headerSubTitle: AppLocalizations.of(context)!.jpjLocationInAllState,
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              children: [
                const SizedBox(height: vPaddingXL),
                _stateNameAndFlag(),
                const SizedBox(height: vPaddingM),
                _branchSelector(),
                const SizedBox(height: vPaddingM),
                _branchInfoBox(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stateNameAndFlag() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Image(
            alignment: Alignment.centerRight,
            image: widget.stateFlag,
            height: 102,
          ),
        ),
        Expanded(
          flex: 7,
          child: Text(
            "JPJ " + widget.stateName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff171f44),
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              letterSpacing: 0.63,
            ),
          ),
        ),
      ],
    );
  }

  Widget _branchSelector() {
    return CustomDropdown(
      dropdownValue: dropdownValue,
      cbFunc: _dropdownCallback,
      dropdownList: dropdownList,
    );
  }

  Widget _branchInfoBox(BuildContext context) {
    return Container(
      width: mediaWidth - 64,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Color(btnShadow),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: _locationIcon(),
              ),
              Expanded(
                flex: 7,
                child: _branchInfo(),
              ),
            ],
          ),
          const SizedBox(height: vPaddingM),
          _mapButton(context),
        ],
      ),
    );
  }

  Widget _locationIcon() {
    return const Padding(
      padding: EdgeInsets.all(vPaddingM),
      child: Image(
        alignment: Alignment.centerRight,
        image: Svg("images/vector/location_icon.svg"),
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _branchInfo() {
    return Padding(
      padding: const EdgeInsets.all(vPaddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            locationData.name!,
            style: const TextStyle(
              color: Color(0xff354c96),
              fontSize: 18,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: vPaddingS),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _branchInfoLabel(
                AppLocalizations.of(context)!.phoneNumber,
                locationData.phoneNo!,
              ),
              _branchInfoLabel(
                AppLocalizations.of(context)!.faxNo,
                locationData.faxNo!,
              ),
            ],
          ),
          const SizedBox(height: vPaddingS),
          _branchInfoLabel(
            AppLocalizations.of(context)!.email,
            locationData.email,
          ),
          const SizedBox(height: vPaddingS),
          _branchInfoLabel(
            AppLocalizations.of(context)!.operationHour,
            locationData.operationalHour,
          ),
          const SizedBox(height: vPaddingS),
          _branchInfoLabel(
            AppLocalizations.of(context)!.coordinate,
            locationData.coordinate!,
          ),
          const SizedBox(height: vPaddingS),
          _branchInfoLabel(
            AppLocalizations.of(context)!.address,
            locationData.address!,
          ),
        ],
      ),
    );
  }

  Widget _branchInfoLabel(String label, String info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget _mapButton(BuildContext context) {
    return InkWell(
      onTap: () {
        _locationBtnCallback();
      },
      child: Container(
        height: 44,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xfff8b518), Color(0xffc18b0e)],
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Container(),
            ),
            Text(
              AppLocalizations.of(context)!.location,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(right: vPaddingM),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _dropdownCallback(String? selectedBranch) {
    for (var item in widget.data) {
      if (item.name == selectedBranch) {
        locationData = item;
      }
    }
    setState(() {
      dropdownValue = selectedBranch!;
    });
  }

  void _locationBtnCallback() {
    final splitted = locationData.coordinate!.split(',');
    MapsLauncher.launchCoordinates(
      double.parse(splitted[0]),
      double.parse(splitted[1]),
    );
  }
}
