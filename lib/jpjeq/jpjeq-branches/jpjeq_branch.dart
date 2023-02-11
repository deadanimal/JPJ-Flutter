import 'package:flutter/material.dart';
import 'package:jpj_info/jpjeq/common/view/theme.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';

class JpjEqBranch extends StatelessWidget {
  const JpjEqBranch({
    Key? key,
    required this.showBranchDetails,
    required this.calculateDistanceFx,
  }) : super(key: key);

  final Function(BuildContext) showBranchDetails;
  final double Function(String) calculateDistanceFx;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          _title(context),
          _flag(),
          _branchList(context),
        ],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: SizedBox(
          width: mediaWidth,
          child: Text(
            AppLocalizations.of(context)!.branch,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(eqThemeNavy),
              fontSize: 20,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }

  Widget _flag() {
    return const Image(
      image: AssetImage("images/jpj_flag.png"),
    );
  }

  Widget _branchList(BuildContext context) {
    return Expanded(
      child: Container(
        width: mediaWidth - 16,
        constraints: const BoxConstraints(maxWidth: 400),
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 200,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return _branchInfoCard(
              context,
              // branches[index],
            );
          },
        ),
      ),
    );
  }

  Widget _branchInfoCard(
    BuildContext context,
    // JpjEqBranchInfo info,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: InkWell(
        onTap: () {
          showBranchDetails(context);
        },
        child: RoundedCornerContainer(
          cornerRadius: 4,
          color: const Color(eqThemeOrange),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Cawangan JB",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${calculateDistanceFx("10.3,100.2").toStringAsFixed(2)} KM",
                              style: const TextStyle(
                                color: Color(0xff707070),
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 24),
                            const Icon(Icons.near_me, size: 15),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
