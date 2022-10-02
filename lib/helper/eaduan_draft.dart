import 'dart:convert';

import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/model/aduan_draft.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EAduanDraft {
  Future<void> saveAsDraft(AduanDraft item) async {
    List<AduanDraft> draft = await getDraftList();
    bool updateDraft = false;
    for (var el in draft) {
      if (el.id == item.id) {
        el.details = item.details;
        el.images = item.images;
        updateDraft = true;
      }
    }

    if (!updateDraft) {
      draft.add(
        AduanDraft(
          id: item.id,
          images: item.images,
          details: item.details,
        ),
      );
    } else {}

    SharedPreferences.getInstance().then((pref) {
      List<String> list = [];
      for (var el in draft) {
        list.add(json.encode(el.toJson()));
      }
      pref.setStringList(
        LocalStorageHelper().eAduanDraft,
        list,
      );
    });
  }

  Future<List<AduanDraft>> getDraftList() async {
    List<AduanDraft> retVal = [];
    final prefs = await SharedPreferences.getInstance();

    try {
      List<String>? draftDetails =
          prefs.getStringList(LocalStorageHelper().eAduanDraft);
      if (draftDetails != null) {
        for (var el in draftDetails) {
          retVal.add(AduanDraft.fromJson(json.decode(el)));
        }
      } else {}
    } catch (e) {
      // print(e);
    }

    return retVal;
  }

  Future<void> erase(String id) async {
    List<AduanDraft> draft = await getDraftList();
    draft.removeWhere((item) => item.id == id);

    SharedPreferences.getInstance().then((pref) {
      List<String> list = [];
      for (var el in draft) {
        list.add(json.encode(el.toJson()));
      }
      pref.setStringList(
        LocalStorageHelper().eAduanDraft,
        list,
      );
    });
  }

  Future<AduanDraft> get(String id) async {
    List<AduanDraft> draft = await getDraftList();

    return draft.firstWhere((element) => element.id == id);
  }
}
