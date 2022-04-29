import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/jpj_eq_menu_controller.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';

class JpjEqCanceledQueue extends StatelessWidget {
  const JpjEqCanceledQueue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          iconColor: Color(themeNavy),
          darkBtn: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: mediaWidth - 32,
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage("images/jpjeq_cancel_number.png"),
                  ),
                  const SizedBox(height: vPaddingXL),
                  Text(
                    AppLocalizations.of(context)!
                        .yourNumberSuccessfullyCanceled,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff171f44),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: vPaddingXL),
                  CustomButton(
                    width: mediaWidth - 128,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const JpjEqMenuController();
                          },
                        ),
                      );
                    },
                    decoration: navyGradientBtnDecoSquare,
                    label: AppLocalizations.of(context)!.back,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavController(),
      ),
    );
  }
}
