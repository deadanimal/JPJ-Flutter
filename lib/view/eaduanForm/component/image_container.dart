import 'dart:typed_data';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ScrollableImageContainer extends StatefulWidget {
  const ScrollableImageContainer({
    Key? key,
    required this.imagesPath,
    required this.openGalleryCallback,
    required this.scrollController,
    required this.eraseImageCallback,
  }) : super(key: key);
  final List<Uint8List> imagesPath;
  final Function openGalleryCallback;
  final ScrollController scrollController;
  final Function(int) eraseImageCallback;

  @override
  State<StatefulWidget> createState() => _ScrollableImageContainer();
}

class _ScrollableImageContainer extends State<ScrollableImageContainer> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 1000),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var i = 0; i < widget.imagesPath.length; i++) {
      children.add(_imageContainer(widget.imagesPath[i], i));
    }
    children.add(_addImageBtn());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        reverse: true,
        scrollDirection: Axis.horizontal,
        controller: widget.scrollController,
        child: Row(
          children: children,
        ),
      ),
    );
  }

  Widget _imageContainer(Uint8List imageData, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Badge(
        badgeContent: InkWell(
          child: const Text("X"),
          onTap: () {
            widget.eraseImageCallback(index);
          },
        ),
        child: Container(
          width: 174,
          height: 174,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.memory(imageData),
        ),
      ),
    );
  }

  Widget _addImageBtn() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          widget.openGalleryCallback();
        },
        child: Container(
          width: 174,
          height: 174,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff2b388d),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "+",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    letterSpacing: 1,
                  ),
                ),
                Opacity(
                  opacity: 0.50,
                  child: Text(
                    "Max 20MB",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
