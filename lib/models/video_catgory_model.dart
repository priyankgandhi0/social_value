// To parse this JSON data, do
//
//     final videoCategory = videoCategoryFromJson(jsonString);

import 'dart:convert';

List<VideoCategory> videoCategoryFromJson(String str) =>
    List<VideoCategory>.from(
        json.decode(str).map((x) => VideoCategory.fromJson(x)));

String videoCategoryToJson(List<VideoCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoCategory {
  String id;
  String title;
  String parentCategoryId;

  VideoCategory({
    required this.id,
    required this.title,
    required this.parentCategoryId,
  });

  factory VideoCategory.fromJson(Map<String, dynamic> json) => VideoCategory(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        parentCategoryId: json["parentCategoryID"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "parentCategoryID": parentCategoryId,
      };
}
