import 'package:flutter/material.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/alert_controller.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/id_types.dart';
import 'package:jpj_info/model/result_style2.dart';
import 'package:jpj_info/model/test_result_request.dart';
import 'package:jpj_info/model/test_result_response.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'dart:convert';
import 'package:jpj_info/view/template/template_result2.dart';
import 'package:jpj_info/view/testResultCheck/test_result_check.dart';

class TestResultController extends StatefulWidget {
  const TestResultController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestResultController();
}

class _TestResultController extends State<TestResultController> {
  late TextEditingController _controller;
  late List<String> dropdownList;
  late String dropdownValue;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = MyJPJAccountManager().id;
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
        body: TestResultCheck(
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
    dropdownValue = newSelection!;
  }

  void _responseHandler(http.Response response) {
    if (response.statusCode == 200) {
      TestResultResponse respond = TestResultResponse.fromJson(
        jsonDecode(response.body),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            List<Result2> dataSet = [];
            // respond.theoryTest?.forEach((el) {
            //   dataSet.add(
            //     Result2(
            //       result: _parseTheoryTestResult(el),
            //       title: "${el.licenseType!} - ${el.testType!}",
            //     ),
            //   );
            // });
            respond.practicalTest?.forEach((el) {
              dataSet.add(
                Result2(
                  result: _parsePracticalTestResult(el),
                  title: "${el.licenseType!} - ${el.testType!}",
                ),
              );
            });

            ResultStyle2 resultData = ResultStyle2(
              vehicalRegNumber: null,
              name: respond.name,
              id: respond.icno,
              title: AppLocalizations.of(context)!.testResult,
              subtitle: AppLocalizations.of(context)!.searchResult,
              results: dataSet,
            );
            return TemplateResult2(
              data: resultData,
            );
          },
        ),
      );
    } else {
      AlertController(ctx: context).connectionError();
    }
  }

  Future<void> _submitCallback(BuildContext context) async {
    if (_controller.text.isNotEmpty) {
      var index =
          dropdownList.indexWhere((element) => element == dropdownValue);
      SiteConfig conf = SiteConfig();
      TestResultRequest req = TestResultRequest(
        kategori: index,
        nokp: _controller.text,
      );
      jpjHttpRequest(
        context,
        Uri.parse(conf.testResultUri),
        headers: conf.formHeader,
        body: jsonEncode(req.toJson()),
        callback: _responseHandler,
      );
    } else {
      TooltipInfo().showInfo(
        context,
        AppLocalizations.of(context)!.errorPleaseTryAgain,
        AppLocalizations.of(context)!.pleaseFillAllInfo,
        (c) {},
      );
    }
  }

  // Widget _parseTheoryTestResult(TheoryTest el) {
  //   return _resultField(
  //     el.testDate!,
  //     el.testVenue!,
  //     el.classType,
  //     el.testResult!,
  //   );
  // }

  Widget _parsePracticalTestResult(PracticalTest el) {
    return _resultField(
      el.testDate!,
      el.testVenue!,
      el.licenseClass,
      el.overAllResult!,
    );
  }

  Widget _resultField(
    String testDate,
    String testVenue,
    String? classType,
    String testResult,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.testDate,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                testDate,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Color(0xff4e4e4e),
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: vPaddingM),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.testLocation,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Flexible(
                child: Text(
                  testVenue.trim(),
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  maxLines: 4,
                  style: const TextStyle(
                      color: Color(0xff4e4e4e),
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
          const SizedBox(height: vPaddingM),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.licenseClass,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                classType ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff4e4e4e),
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: vPaddingM),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.result,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                testResult,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff4e4e4e),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
