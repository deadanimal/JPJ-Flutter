import 'package:flutter/material.dart';
import 'package:jpj_info/model/jpj_eq_service.dart';
import 'package:jpj_info/view/common/color_scheme.dart';
import 'package:jpj_info/view/common/rounded_corner_container.dart';

class JpjEqExpandedCard extends StatefulWidget {
  const JpjEqExpandedCard({
    Key? key,
    required this.service,
    required this.selectionChangeCallback,
  }) : super(key: key);
  final JpjEqService service;
  final Function(JpjEqService, bool) selectionChangeCallback;

  @override
  State<StatefulWidget> createState() => _JpjEqExpandedCard();
}

class _JpjEqExpandedCard extends State<JpjEqExpandedCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundedCornerContainer(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(headerGradient1), Color(headerGradient2)],
        ),
        child: ExpansionTile(
          onExpansionChanged: (expanded) {
            widget.selectionChangeCallback(widget.service, expanded);
          },
          initiallyExpanded: widget.service.selected,
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.service.title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                letterSpacing: 1.25,
              ),
            ),
          ),
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.service.details),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
