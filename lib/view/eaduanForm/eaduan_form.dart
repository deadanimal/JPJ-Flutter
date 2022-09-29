import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/eaduanForm/component/image_container.dart';
import 'package:jpj_info/view/eaduanForm/component/new_image.dart';
import 'package:jpj_info/view/eaduanForm/component/new_media_selector.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:jpj_info/view/form/label.dart';
import 'package:jpj_info/view/form/text_field.dart';
import 'package:latlong2/latlong.dart';

class EaduanForm extends StatelessWidget {
  const EaduanForm({
    Key? key,
    this.title = "",
    required this.image,
    required this.openGalleryCallback,
    required this.submitCallback,
    required this.imagesPath,
    required this.dateController,
    required this.timeController,
    required this.datePickerCb,
    required this.timePickerCb,
    required this.latitudeController,
    required this.longitudeController,
    required this.mapTapCb,
    required this.remarkController,
    required this.locationController,
    required this.stateController,
    required this.vehicleController,
  }) : super(key: key);
  final String? title;
  final AssetImage image;
  final Function(String, String) openGalleryCallback;
  final Function submitCallback;
  final List<Uint8List> imagesPath;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final TextEditingController latitudeController;
  final TextEditingController longitudeController;
  final Function() datePickerCb;
  final Function() timePickerCb;
  final Function(String, String) mapTapCb;
  final TextEditingController remarkController;
  final TextEditingController locationController;
  final TextEditingController stateController;
  final TextEditingController vehicleController;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return SizedBox(
      width: mediaWidth,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _title(context),
            _form(context),
          ],
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return SizedBox(
      width: mediaWidth - 64,
      height: 92,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f000000),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: const Color(0xff2b388d),
                ),
                child: Row(
                  children: [
                    const Spacer(flex: 3),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 92,
                height: 92,
                child: Image(
                  image: image,
                  height: 92,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: vPaddingXL),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          children: [
            CustomLabel(
              label: AppLocalizations.of(context)!.videoPicture,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              align: TextAlign.start,
            ),
            const SizedBox(height: vPaddingM),
            _image(context),
            const SizedBox(height: vPaddingM),
            CustomLabel(
              label: AppLocalizations.of(context)!.videoAttachment,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              align: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldForm(
                label: AppLocalizations.of(context)!.videoAttachment,
                // textController: idTextController,
                width: mediaWidth,
              ),
            ),
            const SizedBox(height: vPaddingM),
            _doubleForm(
              AppLocalizations.of(context)!.eventDate,
              AppLocalizations.of(context)!.eventTime,
              callback1: datePickerCb,
              controller1: dateController,
              readOnly1: true,
              controller2: timeController,
              readOnly2: true,
              callback2: timePickerCb,
            ),
            const SizedBox(height: vPaddingM),
            CustomLabel(
              label: AppLocalizations.of(context)!.coordinate,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              align: TextAlign.start,
            ),
            _map(),
            const SizedBox(height: vPaddingM),
            _doubleForm(
              AppLocalizations.of(context)!.latitude,
              AppLocalizations.of(context)!.longitude,
              controller1: latitudeController,
              controller2: longitudeController,
              readOnly1: true,
              readOnly2: true,
            ),
            const SizedBox(height: vPaddingM),
            CustomLabel(
              label: AppLocalizations.of(context)!.eventLocation,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              align: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldForm(
                label: AppLocalizations.of(context)!.eventLocation,
                textController: locationController,
                width: mediaWidth,
              ),
            ),
            const SizedBox(height: vPaddingM),
            CustomLabel(
              label: AppLocalizations.of(context)!.state,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              align: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldForm(
                label: AppLocalizations.of(context)!.state,
                textController: stateController,
                width: mediaWidth,
              ),
            ),
            const SizedBox(height: vPaddingM),
            CustomLabel(
              label: AppLocalizations.of(context)!.vehicleReg,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              align: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldForm(
                label: AppLocalizations.of(context)!.vehicleReg,
                textController: vehicleController,
                width: mediaWidth,
              ),
            ),
            const SizedBox(height: vPaddingM),
            CustomLabel(
              label: AppLocalizations.of(context)!.shortStatement,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              align: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFieldForm(
                maxLines: 6,
                maxLength: 500,
                inputType: TextInputType.multiline,
                label: AppLocalizations.of(context)!.pleaseTypeHere,
                textController: remarkController,
                width: mediaWidth,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerRight,
              child: Text(
                AppLocalizations.of(context)!.wordsTyped,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Color(0xff707070),
                  fontSize: 10,
                  letterSpacing: 0.35,
                ),
              ),
            ),
            CustomButton(
              width: mediaWidth - 64,
              label: AppLocalizations.of(context)!.submit,
              decoration: navyGradientBtnDeco,
              onPressed: () {
                submitCallback();
              },
            ),
            CustomButton(
              width: mediaWidth - 64,
              label: AppLocalizations.of(context)!.saveAsDraft,
              decoration: orangeGradientBtnDeco,
              textColor: Colors.white,
              onPressed: () {
                submitCallback();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _image(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scrollbar(
      thumbVisibility: true,
      controller: scrollController,
      child: ScrollableImageContainer(
        imagesPath: imagesPath,
        // openGalleryCallback: openGalleryCallback,
        openGalleryCallback: () {
          NewMediaSelector().promptUser(
            context,
            (String media) {
              NewImageSelector().promptUser(context, (source) {
                openGalleryCallback(media, source);
              });
            },
          );
        },
        scrollController: scrollController,
      ),
    );
  }

  Widget _doubleForm(
    String title1,
    String title2, {
    TextEditingController? controller1,
    Function()? callback1,
    bool readOnly1 = false,
    TextEditingController? controller2,
    Function()? callback2,
    bool readOnly2 = false,
  }) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              CustomLabel(
                label: title1,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                align: TextAlign.start,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldForm(
                  label: title1,
                  textController: controller1,
                  width: mediaWidth,
                  onTap: callback1,
                  readOnly: readOnly1,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              CustomLabel(
                label: title2,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                align: TextAlign.start,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFieldForm(
                  label: title2,
                  textController: controller2,
                  width: mediaWidth,
                  onTap: callback2,
                  readOnly: readOnly2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _map() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: mediaHeight / 3,
      width: mediaWidth,
      child: FlutterMap(
        options: MapOptions(
          onTap: (tapPosition, point) => {
            // print(point.toString());
            mapTapCb(point.latitude.toString(), point.longitude.toString()),
          },
          center: LatLng(
            double.parse(latitudeController.text),
            double.parse(longitudeController.text),
          ),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            attributionBuilder: (_) {
              return const Text("© OpenStreetMap contributors");
            },
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(
                  double.parse(latitudeController.text),
                  double.parse(longitudeController.text),
                ),
                builder: (ctx) => const Icon(Icons.pin_drop, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
