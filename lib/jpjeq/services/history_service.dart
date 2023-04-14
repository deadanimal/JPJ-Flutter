import 'dart:convert';
import 'package:jpj_info/jpjeq/model/jpjeq_history_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JPJEqHistoryService {
  static const _key = 'JPJ_EQ_HISTORY';

  // Saves a list of JPJEqHistory objects to shared preferences
  static Future<bool> saveHistory(List<JPJEqHistory> history) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> stringList = [];
    for (var el in history) {
      stringList.add(
        jsonEncode(
          el.toJson(),
        ),
      );
    }
    return prefs.setStringList(_key, stringList);
  }

  // Returns a list of JPJEqHistory objects from shared preferences
  static Future<List<JPJEqHistory>> getHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getStringList(_key);
    List<JPJEqHistory> retVal = [];
    if (json != null) {
      for (var el in json) {
        retVal.add(JPJEqHistory.fromJson(jsonDecode(el)));
      }
    }
    return retVal;
  }

  static Future<bool> save(JPJEqHistory item) async {
    List<JPJEqHistory> history = await getHistory();

    history.add(item);

    return saveHistory(history);
  }

  static Future<JPJEqHistory> getLatest() async {
    List<JPJEqHistory> history = await getHistory();

    return history.last;
  }

  static Future<bool> update(JPJEqHistory item) async {
    List<JPJEqHistory> history = await getHistory();

    if (history.isNotEmpty) {
      history.last = item;
    }

    return saveHistory(history);
  }
}
