import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_nearby_branches_response.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_service_category_response.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';

class JpjEqBranchPopup extends StatelessWidget {
  const JpjEqBranchPopup({
    Key? key,
    required this.openMapFx,
    required this.branchInfo,
    required this.serviceInfo,
  }) : super(key: key);
  final Function(String) openMapFx;
  final JpjBranchData branchInfo;
  final ServiceCategoryResponse serviceInfo;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              _topIcon(context),
              const SizedBox(height: 48),
              _branchInfo(context),
            ],
          ),
        ),
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

  Widget _branchInfo(BuildContext context) {
    return RoundedCornerContainer(
      width: mediaWidth - 32,
      color: const Color(eqThemeSecondaryOrange),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: Color(eqThemeOrange),
            ),
            width: mediaWidth,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                branchInfo.namaCawangan!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 24),
                _branchInfoText(
                  AppLocalizations.of(context)!.address,
                  '${branchInfo.alamat1!},${branchInfo.alamat2!},${branchInfo.alamat3!},${branchInfo.alamat4!}',
                ),
                const SizedBox(height: 24),
                _branchInfoText(
                  AppLocalizations.of(context)!.phoneNumber,
                  branchInfo.noTelefon,
                ),
                const SizedBox(height: 24),
                _branchInfoText(
                  AppLocalizations.of(context)!.faxNo,
                  branchInfo.noFaks,
                ),
                const SizedBox(height: 24),
                _branchInfoText(
                  AppLocalizations.of(context)!.coordinate,
                  '${double.parse(branchInfo.latitud ?? '').toStringAsFixed(3)}, ${double.parse(branchInfo.longitud ?? '').toStringAsFixed(3)}',
                ),
                const SizedBox(height: 24),
                _branchInfoText(
                  AppLocalizations.of(context)!.operationHour,
                  '',
                ),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () {
                    openMapFx('${branchInfo.latitud},${branchInfo.longitud}');
                  },
                  child: Container(
                    width: mediaWidth / 5,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: Color(eqThemeNavy),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.direction,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _branchInfoText(
                  AppLocalizations.of(context)!.noOfWaiting,
                  serviceInfo.quota,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _branchInfoText(String label, String? info) {
    if (1 == 1) {
      return Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Spacer(flex: 1),
          Expanded(
            flex: 6,
            child: Text(
              info ?? "",
              style: const TextStyle(
                fontFamily: "Roboto",
                fontSize: 12,
              ),
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
