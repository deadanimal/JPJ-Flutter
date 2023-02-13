import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/jpjeq/jpjeq-homepage/jpjeq_choose_service.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';

class JpjEqWrongOperatingHour extends StatelessWidget {
  const JpjEqWrongOperatingHour({
    Key? key,
    required this.branchCode,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  final String branchCode;
  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          _topIcon(context),
          const SizedBox(height: 48),
          _image(context),
          _infoText(context),
          _operationHour(context),
          _backButton(context),
        ],
      ),
    );
  }

  Widget _topIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _image(BuildContext context) {
    return const Image(
      image: AssetImage(
        "images/jpjeq/notify.png",
      ),
    );
  }

  Widget _infoText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.scanQrInPermittedTime,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "${AppLocalizations.of(context)!.branchCode} $branchCode",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _operationHour(BuildContext context) {
    return SizedBox(
      width: mediaWidth - 32,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RoundedCornerContainer(
          color: const Color(eqThemeThirdOrange),
          cornerRadius: 8,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.operationHour,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      8,
                    ),
                    bottomRight: Radius.circular(
                      8,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppLocalizations.of(context)!.start,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(startTime),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            AppLocalizations.of(context)!.end,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(endTime),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        //todo: onTap should just pop navigator
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return JpjEqChooseService(
                  dropdownList: ['PELBAGAI', 'SERVICE 1', 'SERVICE 2'],
                  selectionChange: (s) {},
                  submitCallback: (s) {},
                );
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(eqThemeNavy),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              AppLocalizations.of(context)!.back,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
