// To parse this JSON data, do
//
//     final insurance = insuranceFromJson(jsonString);

import 'dart:convert';

List<Insurance> insuranceFromJson(String str) =>
    List<Insurance>.from(json.decode(str).map((x) => Insurance.fromJson(x)));

String insuranceToJson(List<Insurance> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Insurance {
  String id;
  String title;
  String fontAwesomeIcon;
  String link;

  Insurance({
    required this.id,
    required this.title,
    required this.fontAwesomeIcon,
    required this.link,
  });

  factory Insurance.fromJson(Map<String, dynamic> json) => Insurance(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        fontAwesomeIcon: json["fontAwesomeIcon"] ?? "",
        link: json["link"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "fontAwesomeIcon": fontAwesomeIcon,
        "link": link,
      };
}
