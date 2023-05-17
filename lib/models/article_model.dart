// To parse this JSON data, do
//
//     final getArticle = getArticleFromJson(jsonString);

import 'dart:convert';

List<GetArticle> getArticleFromJson(String str) =>
    List<GetArticle>.from(json.decode(str).map((x) => GetArticle.fromJson(x)));

String getArticleToJson(List<GetArticle> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetArticle {
  String? id;
  String? title;
  String? parentCategoryId;

  GetArticle({
    required this.id,
    required this.title,
    required this.parentCategoryId,
  });

  factory GetArticle.fromJson(Map<String, dynamic> json) => GetArticle(
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
