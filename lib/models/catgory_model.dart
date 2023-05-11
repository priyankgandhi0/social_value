// To parse this JSON data, do
//
//     final videoCategory = videoCategoryFromJson(jsonString);

import 'dart:convert';

List<CategoryList> videoCategoryFromJson(String str) => List<CategoryList>.from(
    json.decode(str).map((x) => CategoryList.fromJson(x)));

String videoCategoryToJson(List<CategoryList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryList {
  String id;
  String title;
  String parentCategoryId;

  CategoryList({
    required this.id,
    required this.title,
    required this.parentCategoryId,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
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
