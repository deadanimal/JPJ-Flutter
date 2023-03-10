import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:jpj_info/helper/geolocation.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_nearby_branches_response.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-homepage/jpjeq_homepage.dart';
import 'package:jpj_info/jpjeq/pages/jpjeq-homepage/jpjeq_wrong_operating_hour.dart';
import 'package:jpj_info/jpjeq/services/branch_service.dart';

class JpjEqHomepageController extends StatefulWidget {
  const JpjEqHomepageController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqHomepageController();
}

class _JpjEqHomepageController extends State<JpjEqHomepageController> {
  double currentLat = 1.857434, currentLong = 103.082021;
  String locationName = '';
  String nearestBranch = '';
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
        body: JpjEqHomepage(
          getLocation: getUserLocation,
          scanBtnCallback: scan,
          locationName: locationName,
          nearestBranch: nearestBranch,
        ),
        bottomNavigationBar: const JpjEqBottomNavController(),
      ),
    );
  }

  Future<void> getUserLocation() async {
    setState(() {
      locationName = '';
      nearestBranch = '';
    });
    try {
      Position userLocation = await Geolocation().determinePosition();
      currentLong = userLocation.longitude;
      currentLat = userLocation.latitude;

      List<Placemark> placemarks = await placemarkFromCoordinates(
        currentLat,
        currentLong,
        localeIdentifier: 'ms_MY',
      );
      for (var el in placemarks) {
        if (el.street != null &&
            !_isNumber(el.street![0]) &&
            locationName == '') {
          locationName = el.street!;
        }
      }
      getNearbyBranchList();
    } catch (e) {
      locationName = 'Ralat';
      nearestBranch = 'Ralat';
    }
    setState(() {});
  }

  bool _isNumber(String character) {
    List<String> numbers = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
    ];
    return numbers.contains(character);
  }

  void scan() {
    // todo: check if allowed to scan, if no show error message
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const JpjEqWrongOperatingHour(
            branchCode: "-",
            endTime: "16:10:00",
            startTime: "08:10:00",
          );
        },
      ),
    );
  }

  getNearbyBranchList() {
    BranchService().getNearbyBranchList(context, currentLat, currentLong,
        (Response res) {
      if (res.statusCode == 200) {
        if (res.body == '') {
          setState(() {
            nearestBranch = 'Ralat';
          });
        }
        JpjEqNearbyBranchesResponse response =
            JpjEqNearbyBranchesResponse.fromJson(jsonDecode(res.body));
        if (response.data != null && response.data!.isNotEmpty) {
          setState(() {
            nearestBranch = response.data![0].namaCawangan!;
          });
        }
      }
    });
  }
}
