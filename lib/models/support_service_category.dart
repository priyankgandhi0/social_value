// To parse this JSON data, do
//
//     final supportData = supportDataFromJson(jsonString);

import 'dart:convert';

List<SupportCategoryData> supportCategoryDataFromJson(String str) =>
    List<SupportCategoryData>.from(
        json.decode(str).map((x) => SupportCategoryData.fromJson(x)));

String supportDataToJson(List<SupportCategoryData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupportCategoryData {
  String id;
  String title;

  SupportCategoryData({
    required this.id,
    required this.title,
  });

  factory SupportCategoryData.fromJson(Map<String, dynamic> json) =>
      SupportCategoryData(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
