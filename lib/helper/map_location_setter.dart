import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/form/custom_button.dart';
import 'package:latlong2/latlong.dart';

class MapLocationSetter extends StatefulWidget {
  const MapLocationSetter({
    Key? key,
    required this.long,
    required this.lat,
  }) : super(key: key);
  final String long;
  final String lat;
  @override
  State<StatefulWidget> createState() => _MapLocationSetter();
}

class _MapLocationSetter extends State<MapLocationSetter> {
  late String _long;
  late String _lat;

  @override
  void initState() {
    super.initState();
    _long = widget.long;
    _lat = widget.lat;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: Text(
        AppLocalizations.of(context)!.chooseLocationOnMap,
        textAlign: TextAlign.center,
      ),
      alignment: Alignment.center,
      content: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: mediaWidth,
                  child: FlutterMap(
                    options: MapOptions(
                      onTap: (tapPosition, point) {
                        setState(() {
                          _lat = point.latitude.toString();
                          _long = point.longitude.toString();
                        });
                      },
                      center: LatLng(
                        double.parse(widget.lat),
                        double.parse(widget.long),
                      ),
                      zoom: 10.0,
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate:
                            "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                        subdomains: ['a', 'b', 'c'],
                        attributionBuilder: (_) {
                          return const Text("© OpenStreetMap contributors");
                        },
                      ),
                      MarkerLayerOptions(
                        markers: [
                          Marker(
                            width: 120.0,
                            height: 120.0,
                            point: LatLng(
                              double.parse(_lat),
                              double.parse(_long),
                            ),
                            builder: (ctx) =>
                                const Icon(Icons.pin_drop, color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: CustomButton(
              width: mediaWidth,
              label: AppLocalizations.of(context)!.chooseThisLocation,
              decoration: blueGradientBtnDeco,
              onPressed: () {
                Navigator.pop(context, {
                  "long": _long,
                  "lat": _lat,
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
