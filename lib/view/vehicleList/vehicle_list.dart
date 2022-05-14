import 'package:flutter/material.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/template/template_header.dart';
import 'package:jpj_info/view/vehicleList/component/plate_number.dart';

class VehicleList extends StatelessWidget {
  const VehicleList({
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
    return SingleChildScrollView(
      child: Column(
        children: [
          TemplateHeader(
            headerTitle: pageTitle,
          ),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 400,
              minHeight: 400,
            ),
            child: _vehicleList(context),
          ),
        ],
      ),
    );
  }

  Widget _vehicleList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            const SizedBox(height: vPaddingM),
            PlateNumberContainer(plateNumber: vehiclesNumber[index]),
          ],
        );
      },
      itemCount: vehiclesNumber.length,
    );
  }
}
