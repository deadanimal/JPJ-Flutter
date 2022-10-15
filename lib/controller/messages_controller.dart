import 'package:flutter/material.dart';
import 'package:jpj_info/controller/appbar_controller.dart';
import 'package:jpj_info/controller/bottom_nav_controller.dart';
import 'package:jpj_info/controller/mainpage_controller.dart';
import 'package:jpj_info/helper/exit_prompt.dart';
import 'package:jpj_info/helper/inbox_manager.dart';
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
    _getMessagesList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Exitprompter().prompt(context);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarController(
            decor: customGradient,
            backCb: (c) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MainpageController();
                  },
                ),
              );
            },
          ),
          body: Inbox(
            title: AppLocalizations.of(context)!.inbox,
            transactionList: MenuList(ctx: context).getEzypayMenuList(),
            eraseActionCallback: _eraseCallback,
            markActionCallback: _markCallback,
            readActionCallback: _readCallback,
            msgList: msgList,
          ),
          bottomNavigationBar: const BottomNavController(
            darkTheme: true,
            inInbox: true,
          ),
        ),
      ),
    );
  }

  Future<List<InboxMessages>> _getMessagesList() async {
    if (msgList.isEmpty) {
      msgList = InboxManager().getItems();
    }
    return msgList;
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
    InboxManager().messageRead(msgId);
    setState(() {
      msgList = InboxManager().getItems();
    });
  }

  void _eraseCallback(BuildContext context, String msgId) {
    InboxManager().eraseMessage(msgId);
    setState(() {
      msgList = InboxManager().getItems();
    });
  }
}
