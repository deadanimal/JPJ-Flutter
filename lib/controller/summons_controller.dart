import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/id_types.dart';
import 'package:jpj_info/model/expansion_list.dart';
import 'package:jpj_info/model/license_status_request.dart';
import 'package:jpj_info/model/summons_response.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:jpj_info/view/summonsCheck/summon_check.dart';
import 'package:jpj_info/view/summonsStatus/summons_status.dart';
import 'dart:convert';

class SummonsController extends StatefulWidget {
  const SummonsController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SummonsController();
}

class _SummonsController extends State<SummonsController> {
  late TextEditingController _controller;
  late List<String> dropdownList;
  late String dropdownValue;
  late List<CustomExpensionList> summonsList;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    summonsList = [];
  }

  @override
  void dispose() {
    _controller.dispose();
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
        body: SummonsCheck(
          dropdownList: dropdownList,
          dropdownValue: dropdownValue,
          selectionCallback: _setSelection,
          submitCallback: _submitCallback,
          textController: _controller,
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }

  void _setSelection(String? newSelection) {
    setState(() {
      dropdownValue = newSelection!;
    });
  }

  Future<void> _submitCallback(BuildContext context) async {
    final String response = await rootBundle.loadString('json/summons.json');
    final data = await json.decode(response);
    var index = dropdownList.indexWhere((element) => element == dropdownValue);
    SiteConfig conf = SiteConfig();
    LicenseStatusRequest req = LicenseStatusRequest(
      kategori: index.toString(),
      nokp: _controller.text,
    );
    try {
      EasyLoading.show(
        status: AppLocalizations.of(context)!.pleaseWait,
      );
      final response = await http.post(
        Uri.parse(conf.licenseCheckUri),
        headers: conf.jsonHeader,
        body: jsonEncode(req.toJson()),
      );
      if (response.statusCode == 200) {
        SummonsStatusResponse respond = SummonsStatusResponse.fromJson(data);
        if (respond.summons != null && respond.summons!.isNotEmpty) {
          for (var element in respond.summons!) {
            summonsList.add(
              CustomExpensionList(data: element),
            );
          }
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SummonsStatus(
                data: summonsList,
              );
            },
          ),
        );
      } else {
        AlertController(ctx: context).connectionError();
      }
    } catch (e) {
      AlertController(ctx: context).connectionError();
    } finally {
      EasyLoading.dismiss();
    }
  }
}
