import 'package:flutter/material.dart';
import 'package:jpj_info/model/jpj_eq_branch_info.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';

class JpjEqBranchList extends StatelessWidget {
  const JpjEqBranchList({
    Key? key,
    required this.backCB,
    required this.branches,
    required this.calculateDistanceFx,
  }) : super(key: key);

  final Function(BuildContext) backCB;
  final List<JpjEqBranchInfo> branches;
  final double Function(String) calculateDistanceFx;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.branch,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(themeNavy),
                fontSize: 18,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                letterSpacing: 0.63,
              ),
            ),
            const SizedBox(height: vPaddingXL),
            const Image(image: AssetImage("images/jpj_flag.png")),
            const SizedBox(height: vPaddingXL),
            Container(
              width: mediaWidth - 64,
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  _branches(context),
                  const SizedBox(height: vPaddingXL),
                  CustomButton(
                    width: 210,
                    onPressed: () {
                      backCB(context);
                    },
                    decoration: navyGradientBtnDecoSquare,
                    label: AppLocalizations.of(context)!.back,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _branches(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: branches.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _branchInfoCard(
          context,
          branches[index],
        );
      },
    );
  }

  Widget _branchInfoCard(
    BuildContext context,
    JpjEqBranchInfo info,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: RoundedCornerContainer(
        cornerRadius: 8.0,
        color: const Color(themeNavy),
        child: Row(
          children: [
            const Spacer(flex: 1),
            Expanded(
              flex: 15,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          info.branch,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            color: Color(0xffd06400),
                            fontSize: 15,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              calculateDistanceFx(info.coordinate!)
                                      .toStringAsFixed(2) +
                                  " KM",
                              style: const TextStyle(
                                color: Color(0xff707070),
                                fontSize: 10,
                              ),
                            ),
                            const Icon(Icons.near_me, size: 15),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
