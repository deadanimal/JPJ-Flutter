import 'dart:typed_data';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ScrollableImageContainer extends StatefulWidget {
  const ScrollableImageContainer({
    Key? key,
    required this.imagesPath,
    required this.openGalleryCallback,
    required this.scrollController,
    required this.eraseImageCallback,
    required this.videoPath,
    required this.savedImagePath,
    required this.eraseServerImageCallback,
  }) : super(key: key);
  final List<Uint8List> imagesPath;
  final List<Uint8List> videoPath;
  final List<String> savedImagePath;
  final Function openGalleryCallback;
  final ScrollController scrollController;
  final Function(int, bool) eraseImageCallback;
  final Function(int) eraseServerImageCallback;

  @override
  State<StatefulWidget> createState() => _ScrollableImageContainer();
}

class _ScrollableImageContainer extends State<ScrollableImageContainer> {
  List<Image> savedImages = [];
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
    _getImages();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (var i = 0; i < widget.imagesPath.length; i++) {
      children.add(_imageContainer(widget.imagesPath[i], i));
    }
    for (var i = 0; i < widget.videoPath.length; i++) {
      children.add(_videoContainer(widget.videoPath[i], i));
    }
    for (var i = 0; i < savedImages.length; i++) {
      children.add(_networkImageContainer(savedImages[i], i));
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
      child: badges.Badge(
        badgeContent: InkWell(
          child: const Text("X", style: TextStyle(fontSize: 24)),
          onTap: () {
            widget.eraseImageCallback(index, false);
          },
        ),
        child: Container(
          width: 174,
          height: 174,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
              onTap: () {
                widget.eraseImageCallback(index, false);
              },
              child: Image.memory(imageData)),
        ),
      ),
    );
  }

  Widget _videoContainer(Uint8List imageData, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: badges.Badge(
        badgeContent: InkWell(
          child: const Text("X"),
          onTap: () {
            widget.eraseImageCallback(index, true);
          },
        ),
        child: Container(
          width: 174,
          height: 174,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
              onTap: () {
                widget.eraseImageCallback(index, true);
              },
              child: Image.memory(imageData)),
        ),
      ),
    );
  }

  Widget _networkImageContainer(Image imagePath, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: badges.Badge(
        badgeContent: InkWell(
          child: const Text("X"),
          onTap: () {
            widget.eraseImageCallback(index, true);
          },
        ),
        child: Container(
          width: 174,
          height: 174,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () {
              widget.eraseServerImageCallback(index);
            },
            child: imagePath,
          ),
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
                      fontSize: 13,
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

  Future<void> _getImages() async {
    for (var el in widget.savedImagePath) {
      Image image;
      if (el.contains(RegExp('vid'))) {
        final uint8list = await VideoThumbnail.thumbnailData(
          video: el,
          imageFormat: ImageFormat.JPEG,
          maxWidth: 128,
          quality: 10,
        );
        image = Image.memory(uint8list!);
      } else {
        image = Image.network(el);
      }
      savedImages.add(image);
    }
    setState(() {});
  }
}
