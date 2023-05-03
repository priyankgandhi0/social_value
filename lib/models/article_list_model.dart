// To parse this JSON data, do
//
//     final articleList = articleListFromJson(jsonString);

import 'dart:convert';

List<ArticleList> articleListFromJson(String str) => List<ArticleList>.from(
    json.decode(str).map((x) => ArticleList.fromJson(x)));

String articleListToJson(List<ArticleList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleList {
  String id;
  String title;
  String slug;
  DateTime datePosted;
  String html;
  String featuredImage;

  ArticleList({
    required this.id,
    required this.title,
    required this.slug,
    required this.datePosted,
    required this.html,
    required this.featuredImage,
  });

  factory ArticleList.fromJson(Map<String, dynamic> json) => ArticleList(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        slug: json["slug"] ?? "",
        datePosted: DateTime.parse(json["datePosted"] ?? ""),
        html: json["html"] ?? "",
        featuredImage: json["featuredImage"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "datePosted": datePosted.toIso8601String(),
        "html": html,
        "featuredImage": featuredImage,
      };
}
