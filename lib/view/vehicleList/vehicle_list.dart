import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/vehicleList/component/plate_number.dart';

class VehicleList extends StatelessWidget {
  VehicleList({
    Key? key,
    required this.pageTitle,
    required this.vehiclesNumber,
  }) : super(key: key);

  final String pageTitle;
  final List<String> vehiclesNumber;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return showFeedbackPage(context);
  }

  Widget showFeedbackPage(BuildContext context) {
    return Container(
      height: mediaHeight,
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: pageTitle,
          ),
          Container(
            child: _VehicleList(context),
            // height: mediaHeight,
            constraints: const BoxConstraints(
              maxWidth: 400,
              minHeight: 400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _VehicleList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: verticalPadding),
            PlateNumberContainer(plateNumber: vehiclesNumber[index]),
          ],
        );
      },
      itemCount: vehiclesNumber.length,
    );
  }
}
