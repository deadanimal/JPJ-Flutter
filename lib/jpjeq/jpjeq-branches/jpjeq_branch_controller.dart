import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jpj_info/helper/geolocation.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/jpjeq-branches/jpjeq_branch.dart';
import 'dart:math' show cos, sqrt, asin;

import 'package:jpj_info/jpjeq/jpjeq-branches/jpjeq_branch_popup.dart';
import 'package:maps_launcher/maps_launcher.dart';

class JpjEqBranchController extends StatefulWidget {
  const JpjEqBranchController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqBranchController();
}

class _JpjEqBranchController extends State<JpjEqBranchController> {
  double currentLat = 1.857434, currentLong = 103.082021;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 250),
      getUserLocation,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: JpjEqBranch(
          calculateDistanceFx: _calculateDistance,
          showBranchDetails: _showBranchDetails,
        ),
        bottomNavigationBar: const JpjEqBottomNavController(pageNumber: 1),
      ),
    );
  }

  double _calculateDistance(String coordinate) {
    final splitted = coordinate.split(',');
    double lat1 = double.parse(splitted[0]);
    double lon1 = double.parse(splitted[1]);
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((currentLat - lat1) * p) / 2 +
        c(lat1 * p) * c(currentLat * p) * (1 - c((currentLong - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void _showBranchDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return JpjEqBranchPopup(
            openMapFx: _openMap,
          );
        },
      ),
    );
  }

  void _openMap(String coordinate) {
    final splitted = coordinate.split(',');
    MapsLauncher.launchCoordinates(
      double.parse(splitted[0]),
      double.parse(splitted[1]),
    );
  }

  Future<void> getUserLocation() async {
    Position userLocation = await Geolocation().determinePosition();
    setState(() {
      currentLong = userLocation.longitude;
      currentLat = userLocation.latitude;
    });
  }
}
