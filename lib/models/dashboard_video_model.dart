// To parse this JSON data, do
//
//     final videoData = videoDataFromJson(jsonString);

import 'dart:convert';

List<VideoData> videoDataFromJson(String str) =>
    List<VideoData>.from(json.decode(str).map((x) => VideoData.fromJson(x)));

String videoDataToJson(List<VideoData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoData {
  String id;
  String title;
  String categoryId;
  String museVideoId;
  String videoUrl;
  String? thumbnail;

  VideoData({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.museVideoId,
    this.videoUrl = "",
    this.thumbnail = "",
  });

  factory VideoData.fromJson(Map<String, dynamic> json) => VideoData(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        categoryId: json["categoryID"] ?? "",
        museVideoId: json["museVideoID"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "categoryID": categoryId,
        "museVideoID": museVideoId,
      };
}
