import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jpj_info/helper/geolocation.dart';
import 'package:jpj_info/jpjeq/common/navbar.dart';
import 'package:jpj_info/jpjeq/jpjeq-homepage/jpjeq_homepage.dart';
import 'package:jpj_info/jpjeq/jpjeq-homepage/jpjeq_wrong_operating_hour.dart';

class JpjEqHomepageController extends StatefulWidget {
  const JpjEqHomepageController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _JpjEqHomepageController();
}

class _JpjEqHomepageController extends State<JpjEqHomepageController> {
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
        body: JpjEqHomepage(
          getLocation: getUserLocation,
          scanBtnCallback: scan,
        ),
        bottomNavigationBar: const JpjEqBottomNavController(),
      ),
    );
  }

  Future<void> getUserLocation() async {
    Position userLocation = await Geolocation().determinePosition();
    setState(() {
      //todo: query to get nearby location based on lat long.
      //Consider serving google places or similar API in the back end
      //as google services cant be used in huawei product
      currentLong = userLocation.longitude;
      currentLat = userLocation.latitude;
    });
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
}
