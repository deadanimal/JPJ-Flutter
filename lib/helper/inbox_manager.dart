import 'dart:convert';
import 'package:http/http.dart';
import 'package:jpj_info/config/site_config.dart';
import 'package:jpj_info/controller/http_request_controller.dart';
import 'package:jpj_info/helper/account_manager.dart';
import 'package:jpj_info/helper/local_storage.dart';
import 'package:jpj_info/model/inbox_messages.dart';
import 'package:jpj_info/model/inbox_request.dart';
import 'package:jpj_info/model/inbox_response.dart';
import 'package:jpj_info/model/inbox_update_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InboxManager {
  static final InboxManager _singleton = InboxManager._internal();
  List<InboxMessages> inboxItems = [];

  factory InboxManager() {
    return _singleton;
  }

  InboxManager._internal();

  void init() async {
    final prefs = await SharedPreferences.getInstance();
    String? rawStrings = prefs.getString(LocalStorageHelper().inboxItems);
    if (rawStrings == null || rawStrings == "") {
      _getInboxItemsFromServer();
    } else {
      try {
        for (var el in jsonDecode(rawStrings)) {
          inboxItems.add(InboxMessages.fromJson(el));
        }
        _checkNewMessage();
      } catch (e) {
        _getInboxItemsFromServer();
      }
    }
  }

  void _getInboxItemsFromServer() {
    SiteConfig conf = SiteConfig();
    InboxRequest req = InboxRequest(nokp: MyJPJAccountManager().id);
    jpjSilentHttpRequest(
      Uri.parse(conf.allInboxItem),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: _responseHandler,
    );
  }

  void _responseHandler(Response response) {
    if (response.statusCode == 200) {
      InboxResponse res = InboxResponse.fromJson(jsonDecode(response.body));
      if (res.petiMasuk!.isNotEmpty) {
        for (var el in res.petiMasuk!) {
          if (!_isInTheList(el.id!) && el.status != "erased") {
            inboxItems.add(
              InboxMessages(
                id: el.id!.toString(),
                header: el.tajuk!,
                body: el.perkara!,
                read: el.status == "read",
                date: el.createDate ?? "",
                time: el.createDate ?? "",
              ),
            );
          }
        }
        _saveToStorage();
      }
    }
  }

  bool _isInTheList(int id) {
    bool retVal = false;
    for (var i = 0; i < inboxItems.length; i++) {
      if (inboxItems[i].id == id.toString()) {
        retVal = true;
      }
    }
    return retVal;
  }

  void _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      LocalStorageHelper().inboxItems,
      jsonEncode(
        inboxItems
            .map(
              (v) => v.toJson(),
            )
            .toList(),
      ),
    );
  }

  int getNumberOfUnreadItems() {
    int retVal = 0;
    for (var el in inboxItems) {
      if (!el.read) {
        retVal++;
      }
    }
    return retVal;
  }

  List<InboxMessages> getItems() {
    return inboxItems;
  }

  void _updateDb(String id, String status) {
    SiteConfig conf = SiteConfig();
    InboxUpdateRequest req = InboxUpdateRequest(
      idNoti: id,
      status: status,
    );
    jpjSilentHttpRequest(
      Uri.parse(conf.updateInboxItem),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: (Response r) {
        // print(r.body);
      },
    );
  }

  void messageRead(String id) {
    for (var el in inboxItems) {
      if (el.id.toString() == id) {
        el.read = true;
      }
    }
    _saveToStorage();
    _updateDb(id, "read");
  }

  void eraseMessage(String id) {
    for (var el in inboxItems) {
      if (el.id.toString() == id) {
        inboxItems.remove(el);
      }
    }
    _saveToStorage();
    _updateDb(id, "erased");
  }

  void _checkNewMessage() {
    SiteConfig conf = SiteConfig();
    InboxRequest req = InboxRequest(nokp: MyJPJAccountManager().id);
    jpjSilentHttpRequest(
      Uri.parse(conf.unreadItem),
      headers: conf.formHeader,
      body: jsonEncode(req.toJson()),
      callback: _responseHandler,
    );

    Future.delayed(
      const Duration(milliseconds: 5000),
      _checkNewMessage,
    );
  }
}
