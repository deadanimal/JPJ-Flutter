import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jpj_info/helper/custom_messages_icon.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/spacing.dart';

class CustomSlidableMessages extends StatelessWidget {
  const CustomSlidableMessages({
    Key? key,
    required this.header,
    required this.body,
    required this.readActionCallback,
    required this.markActionCallback,
    required this.eraseActionCallback,
    required this.read,
  }) : super(key: key);
  final String header;
  final String body;
  final Function() readActionCallback;
  final Function() markActionCallback;
  final Function() eraseActionCallback;
  final bool read;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: read ? 0.5 : 1.0,
      child: Padding(
        padding: const EdgeInsets.only(
          top: vPaddingM,
          bottom: vPaddingM,
        ),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  markActionCallback();
                },
                backgroundColor: const Color(markReadOrange),
                foregroundColor: Colors.white,
                icon: CustomMessagesIcon.markUnreadIcon,
              ),
            ],
          ),
          endActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (BuildContext context) {
                  eraseActionCallback();
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: CustomMessagesIcon.deleteMsgIcon,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: vPaddingM,
              right: vPaddingM,
            ),
            child: InkWell(
              onTap: readActionCallback,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        header,
                        style: const TextStyle(
                          color: Color(0xffd06400),
                          fontSize: 16,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: vPaddingS),
                      Text(
                        body,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: Color(0xff848484),
                          fontSize: 11,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.arrow_right_rounded),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
