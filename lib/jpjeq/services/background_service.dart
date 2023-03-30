import 'dart:convert';

import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/jpjeq/dummy.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_get_ticket_number_response.dart';
import 'package:jpj_info/jpjeq/model/jpjeq_refresh_waiting_time_response.dart';
import 'package:jpj_info/jpjeq/services/branch_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackgroundService {
  startCheck() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? rawValue = sharedPreferences.getString(
      LocalStorageHelper().jpjeQNumberInfo,
    );
    String? selectedService = sharedPreferences.getString(
      LocalStorageHelper().jpjeQSelectedService,
    );

    if (rawValue != null && selectedService != null) {
      var ticketInfo = JpjEqGetTicketNumberResponse.fromJson(
        jsonDecode(
          rawValue,
        ),
      );
      var response = await BranchService().refreshWaitingTime(
        ticketInfo.noSiri ?? "",
        ticketInfo.cawangan ?? "",
        selectedService,
      );

      if (response.statusCode == 200) {
        JpjEqRefreshWaitingTimeResponse refreshData =
            JpjEqRefreshWaitingTimeResponse.fromJson(
          jsonDecode(
            response.body,
            // Dummy().refreshWaitingTime,
          ),
        );
        ticketInfo.cawangan = refreshData.cawangan;
        ticketInfo.kedudukanMenunggu = refreshData.kedudukanMenunggu;
        ticketInfo.noSekarang = refreshData.noSekarang;
        ticketInfo.masaMenunggu = refreshData.masaMenunggu;

        var success = await sharedPreferences.setString(
          LocalStorageHelper().jpjeQNumberInfo,
          jsonEncode(ticketInfo.toJson()),
        );

        print(success);
      }
    }

    try {} catch (err) {
      // Logger().e(err.toString()); // Logger flutter package, prints error on the debug console
      throw Exception(err);
    }
  }
}
