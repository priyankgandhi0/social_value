// To parse this JSON data, do
//
//     final companyList = companyListFromJson(jsonString);

import 'dart:convert';

CompanyList companyListFromJson(String str) =>
    CompanyList.fromJson(json.decode(str));

String companyListToJson(CompanyList data) => json.encode(data.toJson());

class CompanyList {
  String status;
  String title;
  dynamic website;
  String? wellbeingScore;
  String? sustainabilityScore;
  String? diversityScore;
  String logoImage;

  CompanyList({
    required this.status,
    required this.title,
    this.website,
    required this.wellbeingScore,
    required this.sustainabilityScore,
    required this.diversityScore,
    required this.logoImage,
  });

  factory CompanyList.fromJson(Map<String, dynamic> json) => CompanyList(
        status: json["status"],
        title: json["title"],
        website: json["website"],
        wellbeingScore: json["wellbeingScore"],
        sustainabilityScore: json["sustainabilityScore"],
        diversityScore: json["diversityScore"],
        logoImage: json["logoImage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "title": title,
        "website": website,
        "wellbeingScore": wellbeingScore,
        "sustainabilityScore": sustainabilityScore,
        "diversityScore": diversityScore,
        "logoImage": logoImage,
      };
}
