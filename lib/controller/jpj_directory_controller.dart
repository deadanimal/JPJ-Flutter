import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/model/jpj_location_info.dart';
import 'package:jpj_info/model/jpj_location_request.dart';
import 'package:jpj_info/model/jpj_location_response.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/jpjDirectory/jpj_directory.dart';
import 'package:http/http.dart' as http;
import 'package:jpj_info/view/jpjDirectoryInfo/jpj_directory_info.dart';

class JpjDirectoryController extends StatefulWidget {
  const JpjDirectoryController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjDirectoryController();
}

class _JpjDirectoryController extends State<JpjDirectoryController> {
  List<MenuItem> dirctoryMenuItem = [];
  late List<JpjLocationResponseData> results;
  late List<JpjLocationInfo> locationInputInfo;

  @override
  void initState() {
    locationInputInfo = [];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: FutureBuilder<List<MenuItem>>(
          future: _getDirectoryInfo(),
          builder:
              (BuildContext context, AsyncSnapshot<List<MenuItem>> snapshot) {
            if (!snapshot.hasData) {
              // while data is loading:
              EasyLoading.show(
                status: AppLocalizations.of(context)!.pleaseWait,
              );
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              EasyLoading.dismiss();
              return JpjDirectory(
                locationList: snapshot.data!,
              );
            }
          },
        ),
        bottomNavigationBar: BottomNavController(
          darkTheme: true,
          inMenu: true,
        ),
      ),
    );
  }

  Future<List<MenuItem>> _getDirectoryInfo() async {
    final String response =
        await rootBundle.loadString('json/jpj_location.json');
    final data = await json.decode(response);
    data["data"].forEach(
      (element) {
        JpjLocationInfo b = JpjLocationInfo.fromJson(element);
        locationInputInfo.add(b);
        dirctoryMenuItem.add(
          MenuItem(
            b.name,
            b.flagPath,
            (BuildContext context) {
              _submitCallback(context, b.id!);
            },
          ),
        );
      },
    );
    return dirctoryMenuItem;
  }

  Future<void> _submitCallback(BuildContext context, String locationId) async {
    try {
      EasyLoading.show(
        status: AppLocalizations.of(context)!.pleaseWait,
      );
      SiteConfig conf = SiteConfig();
      JpjLocationRequest req = JpjLocationRequest(id: locationId);

      final response = await http.post(
        Uri.parse(conf.locationCheckUri),
        headers: conf.jsonHeader,
        body: jsonEncode(req.toJson()),
      );
      if (response.statusCode == 200) {
        JpjLocationResponse respond = JpjLocationResponse.fromJson(
          jsonDecode(response.body),
        );
        if (respond.data != null && respond.data!.isNotEmpty) {
          AssetImage flagIcon = const AssetImage("");
          String stateName = "";
          for (var element in locationInputInfo) {
            if (element.id == locationId) {
              flagIcon = AssetImage(element.flagPath!);
              stateName = element.name!;
            }
          }
          results = respond.data!;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return JpjDirectoryInfo(
                  stateFlag: flagIcon,
                  stateName: stateName,
                  data: results,
                );
              },
            ),
          );
        } else {
          AlertController(ctx: context).noDataFound();
        }
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
