import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/helper/menu_list.dart';
import 'package:jpj_info/model/inbox_messages.dart';
import 'package:jpj_info/view/appBarHeader/gradient_decor.dart';
import 'package:jpj_info/view/form/tooltip_info.dart';
import 'package:jpj_info/view/inbox/inbox.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MessageController extends StatefulWidget {
  const MessageController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageController();
}

class _MessageController extends State<MessageController> {
  List<InboxMessages> msgList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarController(
          decor: customGradient,
        ),
        body: FutureBuilder<List<InboxMessages>>(
          future: _getMessagesList(),
          builder: (BuildContext context,
              AsyncSnapshot<List<InboxMessages>> snapshot) {
            if (!snapshot.hasData) {
              EasyLoading.show(
                status: AppLocalizations.of(context)!.pleaseWait,
              );
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              EasyLoading.dismiss();
              return Inbox(
                title: AppLocalizations.of(context)!.inbox,
                transactionList: MenuList(ctx: context).getEzypayMenuList(),
                eraseActionCallback: _eraseCallback,
                markActionCallback: _markCallback,
                readActionCallback: _readCallback,
                refreshCallback: _refreshMsgList,
                msgList: msgList,
              );
            }
          },
        ),
        bottomNavigationBar: BottomNavController(
          darkTheme: true,
          inInbox: true,
        ),
      ),
    );
  }

  Future<List<InboxMessages>> _getMessagesList() async {
    if (msgList.isEmpty) {
      final String response = await rootBundle.loadString('json/messages.json');
      final data = await json.decode(response);
      data.forEach(
        (element) {
          InboxMessages b = InboxMessages.fromJson(element);
          msgList.add(b);
        },
      );
    }
    return msgList;
  }

  void _refreshMsgList() async {
    final String response = await rootBundle.loadString('json/messages.json');
    final data = await json.decode(response);
    setState(() {
      msgList.clear();
      data.forEach(
        (element) {
          InboxMessages b = InboxMessages.fromJson(element);
          msgList.add(b);
        },
      );
    });
  }

  void _readCallback(BuildContext context, String msgId) {
    setState(() {
      for (var item in msgList) {
        if (item.id == msgId) {
          TooltipInfo().showInfo(
            context,
            item.header,
            item.body,
            (c) => {
              if (!item.read) {_markCallback(context, item.id)},
            },
          );
        }
      }
    });
  }

  void _markCallback(BuildContext context, String msgId) {
    setState(() {
      for (var item in msgList) {
        if (item.id == msgId) {
          item.read = !item.read;
        }
      }
    });
  }

  void _eraseCallback(BuildContext context, String msgId) {
    setState(() {
      for (var item in msgList) {
        if (item.id == msgId) {
          msgList.remove(item);
        }
      }
    });
  }
}
