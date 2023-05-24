// To parse this JSON data, do
//
//     final supportData = supportDataFromJson(jsonString);

import 'dart:convert';

List<HelpLinesModel> supportDataFromJson(String str) => List<HelpLinesModel>.from(
    json.decode(str).map((x) => HelpLinesModel.fromJson(x)));

String supportDataToJson(List<HelpLinesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class HelpLinesModel {
  String? id;
  String? title;
  List<SupportData>? items;

  HelpLinesModel({this.id, this.title, this.items});

  HelpLinesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['items'] != null) {
      items = <SupportData>[];
      json['items'].forEach((v) {
        items!.add(SupportData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


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
