// To parse this JSON data, do
//
//     final fundraising = fundraisingFromJson(jsonString);

import 'dart:convert';

List<Fundraising> fundraisingFromJson(String str) => List<Fundraising>.from(
    json.decode(str).map((x) => Fundraising.fromJson(x)));

String fundraisingToJson(List<Fundraising> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Fundraising {
  String id;
  String title;
  String description;

  Fundraising({
    required this.id,
    required this.title,
    required this.description,
  });

  factory Fundraising.fromJson(Map<String, dynamic> json) => Fundraising(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
      };
}
