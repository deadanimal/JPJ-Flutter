import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/eaduanForm/component/image_container.dart';
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
  }) : super(key: key);
  final String? title;
  final AssetImage image;
  final Function openGalleryCallback;
  final Function submitCallback;
  final List<Uint8List> imagesPath;

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
                            fontFamily: "Poppins",
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
            _image(),
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
                // textController: idTextController,
                width: mediaWidth,
              ),
            ),
            const SizedBox(height: vPaddingM),
            _doubleForm(
              AppLocalizations.of(context)!.state,
              AppLocalizations.of(context)!.vehicleReg,
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
                inputType: TextInputType.multiline,
                label: AppLocalizations.of(context)!.pleaseTypeHere,
                // textController: textController,
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
              decoration: whiteBtnDeco,
              textColor: const Color(themeNavy),
              onPressed: () {
                submitCallback();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    ScrollController _scrollController = ScrollController();
    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: ScrollableImageContainer(
        imagesPath: imagesPath,
        openGalleryCallback: openGalleryCallback,
        scrollController: _scrollController,
      ),
    );
  }

  Widget _doubleForm(String title1, String title2) {
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
                  // textController: idTextController,
                  width: mediaWidth,
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
                  // textController: idTextController,
                  width: mediaWidth,
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
          center: LatLng(3.165, 101.609),
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
                point: LatLng(3.165, 101.609),
                builder: (ctx) => const Icon(Icons.pin_drop, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
