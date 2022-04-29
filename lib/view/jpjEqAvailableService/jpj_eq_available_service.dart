import 'package:flutter/material.dart';
import 'package:jpj_info/model/jpj_eq_service.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/jpjEqAvailableService/component/expanded_card.dart';

class JpjEqAvailableService extends StatelessWidget {
  const JpjEqAvailableService({
    Key? key,
    required this.backBtnCallback,
    required this.services,
    required this.selectionChangeCallback,
  }) : super(key: key);

  final Function(BuildContext) backBtnCallback;
  final List<JpjEqService> services;
  final Function(JpjEqService, bool) selectionChangeCallback;

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
              _topInfoContainer(context),
              const SizedBox(height: vPaddingXL),
              _services(context),
              const SizedBox(height: vPaddingXL),
              _submitBtn(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topInfoContainer(BuildContext context) {
    return RoundedCornerContainer(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          AppLocalizations.of(context)!.chooseServiceInfo,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xff707070),
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _services(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: services.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _expansionTile(services[index]);
      },
    );
  }

  Widget _expansionTile(JpjEqService service) {
    return JpjEqExpandedCard(
      service: service,
      selectionChangeCallback: selectionChangeCallback,
    );
  }

  Widget _submitBtn(BuildContext context) {
    return CustomButton(
      onPressed: () {
        backBtnCallback(context);
      },
      decoration: navyGradientBtnDeco,
      label: AppLocalizations.of(context)!.submit,
      width: mediaWidth - 128,
    );
  }
}
