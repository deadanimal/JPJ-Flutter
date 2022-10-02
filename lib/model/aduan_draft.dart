import 'dart:convert';
import 'dart:typed_data';

import 'package:jpj_info/model/aduan_save_request.dart';

class AduanDraft {
  AduanSaveRequest? details;
  List<Uint8List>? images;
  List<Uint8List>? videos;
  List<Uint8List>? videoThumbnails;
  String? id;

  AduanDraft({
    this.details,
    required this.id,
    required this.images,
    required this.videos,
    required this.videoThumbnails,
  });

  AduanDraft.fromJson(Map<String, dynamic> json) {
    details = json['details'] != null
        ? AduanSaveRequest.fromJson(json['details'])
        : null;
    id = json['id'];
    images = <Uint8List>[];
    videos = <Uint8List>[];
    videoThumbnails = <Uint8List>[];
    json['images'].forEach((v) {
      images!.add(base64.decode(v));
    });
    json['videos'].forEach((v) {
      videos!.add(base64.decode(v));
    });
    json['videoThumbnails'].forEach((v) {
      videoThumbnails!.add(base64.decode(v));
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
    return data;
  }
}
