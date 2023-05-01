// To parse this JSON data, do
//
//     final supportData = supportDataFromJson(jsonString);

import 'dart:convert';

List<SupportData> supportDataFromJson(String str) => List<SupportData>.from(
    json.decode(str).map((x) => SupportData.fromJson(x)));

String supportDataToJson(List<SupportData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupportData {
  String id;
  String title;
  String phone;
  String website;
  String? description;

  SupportData({
    required this.id,
    required this.title,
    required this.phone,
    required this.website,
    this.description,
  });

  factory SupportData.fromJson(Map<String, dynamic> json) => SupportData(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        phone: json["phone"] ?? "",
        website: json["website"] ?? "",
        description: json["description"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "phone": phone,
        "website": website,
        "description": description,
      };
}
