import 'dart:convert';
import 'dart:typed_data';

import 'package:jpj_info/model/aduan_save_request.dart';

class AduanDraft {
  AduanSaveRequest? details;
  List<Uint8List>? images;
  List<Uint8List>? videos;
  List<Uint8List>? videoThumbnails;
  List<String>? videoExt;
  List<String>? imageExt;
  String? id;

  AduanDraft({
    this.details,
    required this.id,
    required this.images,
    required this.videos,
    required this.videoThumbnails,
    required this.videoExt,
    required this.imageExt,
  });

  AduanDraft.fromJson(Map<String, dynamic> json) {
    details = json['details'] != null
        ? AduanSaveRequest.fromJson(json['details'])
        : null;
    id = json['id'];
    images = <Uint8List>[];
    videos = <Uint8List>[];
    videoThumbnails = <Uint8List>[];
    videoExt = <String>[];
    imageExt = <String>[];
    json['images'].forEach((v) {
      images!.add(base64.decode(v));
    });
    json['videos'].forEach((v) {
      videos!.add(base64.decode(v));
    });
    json['videoThumbnails'].forEach((v) {
      videoThumbnails!.add(base64.decode(v));
    });

    json['videoExt'].forEach((v) {
      videoExt!.add(v);
    });
    json['imageExt'].forEach((v) {
      imageExt!.add(v);
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (details != null) {
      data['details'] = details!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => base64.encode(v)).toList();
    }
    if (videos != null) {
      data['videos'] = videos!.map((v) => base64.encode(v)).toList();
    }
    if (videoThumbnails != null) {
      data['videoThumbnails'] =
          videoThumbnails!.map((v) => base64.encode(v)).toList();
    }
    data['id'] = id;
    data['imageExt'] = imageExt;
    data['videoExt'] = videoExt;
    return data;
  }
}
