import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/helper/exit_prompt.dart';
import 'package:jpj_info/model/jpj_directory_response.dart';
import 'package:jpj_info/model/jpj_location_info.dart';
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
  List<CustomMenuItem> dirctoryCustomMenuItem = [];
  late List<JpjLocationResponseData> results;
  late List<JpjLocationInfo> locationInputInfo;
  List<JpjDirectoryResponse> directoryList = [];

  @override
  void initState() {
    locationInputInfo = [];
    Future.delayed(
      const Duration(milliseconds: 250),
      _getDirectories,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Exitprompter().prompt(context);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarController(
            decor: customGradient,
            backCb: (c) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MainpageController();
                  },
                ),
              );
            },
          ),
          body: FutureBuilder<List<CustomMenuItem>>(
            future: _getDirectoryInfo(),
            builder: (BuildContext context,
                AsyncSnapshot<List<CustomMenuItem>> snapshot) {
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
            inDirectory: true,
          ),
        ),
      ),
    );
  }

  Future<List<CustomMenuItem>> _getDirectoryInfo() async {
    final String response =
        await rootBundle.loadString('json/jpj_location.json');
    final data = json.decode(response);
    data["data"].forEach(
      (element) {
        JpjLocationInfo b = JpjLocationInfo.fromJson(element);
        locationInputInfo.add(b);
        dirctoryCustomMenuItem.add(
          CustomMenuItem(
            b.name,
            b.flagPath,
            (BuildContext context) {
              _submitCallback(context, b.id!);
            },
          ),
        );
      },
    );
    return dirctoryCustomMenuItem;
  }

  void _submitCallback(BuildContext context, String locationId) {
    String stateName = "";
    AssetImage flagIcon = const AssetImage("");
    for (var element in locationInputInfo) {
      if (element.id == locationId) {
        flagIcon = AssetImage(element.flagPath!);
        stateName = element.name!;
      }
    }
    JpjDirectoryResponse? directoryInfo;
    for (var el in directoryList) {
      if (el.namaNegeri == stateName) {
        directoryInfo = el;
      }
    }

    List<JpjLocationResponseData> result = [];

    if (directoryInfo != null) {
      for (var el in directoryInfo.cawangan!) {
        result.add(
          JpjLocationResponseData(
              address: el.alamatCawangan,
              coordinate2: el.koordinatCawangan,
              coordinate: el.koordinatCawangan,
              faxNo: el.nofaksCawangan,
              name: el.namaCawangan,
              phoneNo: el.notelefonCawangan,
              stateId: locationId,
              operationalHour: el.waktuperkhidmatanCawangan),
        );
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return JpjDirectoryInfo(
            stateFlag: flagIcon,
            stateName: stateName,
            data: result,
          );
        },
      ),
    );
  }

  void _getDirectories() {
    SiteConfig conf = SiteConfig();
    jpjHttpGetRequest(
      context,
      Uri.parse(conf.directory),
      headers: conf.formHeader,
      callback: (http.Response response) {
        if (response.statusCode == 200) {
          for (var el in jsonDecode(response.body)) {
            directoryList.add(
              JpjDirectoryResponse.fromJson(el),
            );
          }
        }
      },
    );
  }
}
