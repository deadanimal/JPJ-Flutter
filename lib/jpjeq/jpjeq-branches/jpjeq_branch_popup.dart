import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';

class JpjEqBranchPopup extends StatelessWidget {
  const JpjEqBranchPopup({
    Key? key,
    required this.openMapFx,
  }) : super(key: key);
  final Function(String) openMapFx;

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
          _branchInfo(context),
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
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "JPJ Cawangan Putrajaya",
                style: TextStyle(
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
                  'branch.address',
                ),
                const SizedBox(height: 24),
                _branchInfoText(
                  AppLocalizations.of(context)!.phoneNumber,
                  'branch.phoneNumber',
                ),
                const SizedBox(height: 24),
                _branchInfoText(
                  AppLocalizations.of(context)!.faxNo,
                  'branch.faxNumber',
                ),
                const SizedBox(height: 24),
                _branchInfoText(
                  AppLocalizations.of(context)!.coordinate,
                  'branch.coordinate',
                ),
                const SizedBox(height: 24),
                _branchInfoText(
                  AppLocalizations.of(context)!.operationHour,
                  'branch.operationHour',
                ),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () {
                    openMapFx('10.3,10.3');
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
                  'branch.waitingListCount',
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
    if (info != null) {
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
              info,
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
