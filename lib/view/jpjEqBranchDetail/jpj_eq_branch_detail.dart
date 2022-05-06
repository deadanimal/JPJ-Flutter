import 'package:flutter/material.dart';
import 'package:jpj_info/model/jpj_eq_branch_info.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';

class JpjEqBranchDetail extends StatelessWidget {
  const JpjEqBranchDetail({
    Key? key,
    required this.backCB,
    required this.branch,
    required this.openMapFx,
  }) : super(key: key);

  final Function(BuildContext) backCB;
  final JpjEqBranchInfo branch;
  final Function(String) openMapFx;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: mediaWidth - 64,
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            children: [
              const SizedBox(height: vPaddingXL),
              _branchDetails(context),
              const SizedBox(height: vPaddingXL),
              _branchServices(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _branchDetails(BuildContext context) {
    return RoundedCornerContainer(
      width: double.infinity,
      cornerRadius: 8.0,
      child: Column(
        children: [
          RoundedCornerContainer(
            width: double.infinity,
            cornerRadius: 8.0,
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(headerGradient1), Color(headerGradient2)],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                branch.branch,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.63,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: vPaddingM),
                _branchInfoText(
                  AppLocalizations.of(context)!.address,
                  branch.address,
                ),
                const SizedBox(height: vPaddingM),
                _branchInfoText(
                  AppLocalizations.of(context)!.phoneNumber,
                  branch.phoneNumber,
                ),
                const SizedBox(height: vPaddingM),
                _branchInfoText(
                  AppLocalizations.of(context)!.faxNo,
                  branch.faxNumber,
                ),
                const SizedBox(height: vPaddingM),
                _branchInfoText(
                  AppLocalizations.of(context)!.coordinate,
                  branch.coordinate,
                ),
                const SizedBox(height: vPaddingM),
                CustomButton(
                  onPressed: () {
                    openMapFx(branch.coordinate!);
                  },
                  width: 128,
                  decoration: yellowGradientBtnDeco,
                  label: AppLocalizations.of(context)!.direction,
                ),
                const SizedBox(height: vPaddingM),
                _branchInfoText(
                  AppLocalizations.of(context)!.noOfWaiting,
                  branch.waitingListCount,
                ),
                const SizedBox(height: vPaddingM),
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
                color: Color(themeNavy),
                fontSize: 12,
                fontFamily: "Poppins",
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
                color: Color(themeNavy),
                fontFamily: "Poppins",
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

  Widget _branchServices(BuildContext context) {
    return RoundedCornerContainer(
      cornerRadius: 8.0,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.serviceProvided,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w900,
                letterSpacing: 0.70,
                color: Color(themeNavy),
              ),
            ),
            const Divider(
              color: Colors.black,
            ),
            _serviceListBuilder(),
          ],
        ),
      ),
    );
  }

  Widget _serviceListBuilder() {
    if (branch.services != null) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: branch.services?.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  branch.services![index].category!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: branch.services![index].services?.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index2) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.fiber_manual_record),
                          Flexible(
                            child: Text(
                              branch.services![index].services![index2],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
