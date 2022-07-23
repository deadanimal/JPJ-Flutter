import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavMenuItem {
  FavMenuItem(this.id, this.count);
  late int id;
  late int count;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['count'] = count;
    return data;
  }

  String toString() {
    return jsonEncode(toJson());
  }
}

class FavMenu {
  static final FavMenu _singleton = FavMenu._internal();

  factory FavMenu() {
    return _singleton;
  }

  FavMenu._internal();

  List<FavMenuItem> favMenu = [
    FavMenuItem(1, 0),
    FavMenuItem(2, 0),
    FavMenuItem(3, 0),
    FavMenuItem(4, 0),
    FavMenuItem(5, 0),
    FavMenuItem(6, 0),
  ];

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      String? favMenuItem = prefs.getString(LocalStorageHelper().favMenuItem);
      if (favMenuItem != null) {
        var favMenu1 = json.decode(favMenuItem);
        favMenu.clear();

        for (var item in favMenu1) {
          favMenu.add(FavMenuItem(item["id"], item["count"]));
        }
      }
    } catch (e) {
      // print("error");
    }
  }

  List<CustomMenuItem> getFavMenuItem(BuildContext context) {
    List<CustomMenuItem> retFavMenu = MenuList(ctx: context).getFavMenuList();
    List<CustomMenuItem> menu = MenuList(ctx: context).getServisMenuList();
    favMenu.sort((a, b) => b.count.compareTo(a.count));
    for (var el in menu) {
      if (el.serviceId == favMenu[0].id) {
        retFavMenu[0] = el;
      } else if (el.serviceId == favMenu[1].id) {
        retFavMenu[1] = el;
      } else if (el.serviceId == favMenu[2].id) {
        retFavMenu[2] = el;
      }
    }
    return retFavMenu;
  }

  void clicked(int itemId) {
    for (var item in favMenu) {
      if (item.id == itemId) {
        item.count++;
      }
    }

    SharedPreferences.getInstance().then((pref) {
      pref.setString(LocalStorageHelper().favMenuItem, json.encode(favMenu));
    });
  }
}
