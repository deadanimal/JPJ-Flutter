import 'package:flutter/material.dart';
import 'package:jpj_info/model/inbox_messages.dart';
import 'package:jpj_info/model/mainpage_icon.dart';
import 'package:jpj_info/model/page_size.dart';
import 'package:jpj_info/view/common/spacing.dart';
import 'package:jpj_info/view/inbox/component/slidable_messages.dart';
import 'package:jpj_info/view/template/template_header.dart';

class Inbox extends StatelessWidget {
  const Inbox({
    Key? key,
    required this.transactionList,
    required this.title,
    required this.readActionCallback,
    required this.markActionCallback,
    required this.eraseActionCallback,
    required this.msgList,
    required this.refreshCallback,
  }) : super(key: key);
  final List<MenuItem> transactionList;
  final String title;
  final List<InboxMessages> msgList;
  final Function(BuildContext, String) readActionCallback;
  final Function(BuildContext, String) markActionCallback;
  final Function(BuildContext, String) eraseActionCallback;
  final Function() refreshCallback;

  @override
  Widget build(BuildContext context) {
    mediaWidth = (MediaQuery.of(context).size.width);
    mediaHeight = (MediaQuery.of(context).size.height);
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/main_bg.png"),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TemplateHeader(
              headerTitle: title,
            ),
            const SizedBox(height: vPaddingXL),
            _bodyList(context),
            const SizedBox(height: vPaddingXL),
          ],
        ),
      ),
    );
  }

  Widget _bodyList(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400, minHeight: 200),
      width: mediaWidth - 64,
      child: Padding(
        padding: const EdgeInsets.only(
            top: verticalPadding, bottom: verticalPadding),
        child: _msgList(context),
      ),
    );
  }

  Widget _msgList(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => refreshCallback(),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: msgList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _slidableMessage(
            msgList[index].header,
            msgList[index].body,
            msgList[index].id,
            msgList[index].read,
            context,
          );
        },
      ),
    );
  }

  Widget _slidableMessage(String header, String body, String msgId, bool read,
      BuildContext context) {
    return CustomSlidableMessages(
      header: header,
      body: body,
      read: read,
      eraseActionCallback: () {
        eraseActionCallback(context, msgId);
      },
      markActionCallback: () {
        markActionCallback(context, msgId);
      },
      readActionCallback: () {
        readActionCallback(context, msgId);
      },
    );
  }
}
