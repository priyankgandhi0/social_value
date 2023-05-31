


import 'dart:convert';

List<VolunteeringModel> volunteeringFromJson(String str) => List<VolunteeringModel>.from(
    json.decode(str).map((x) => VolunteeringModel.fromJson(x)));

String volunteeringToJson(List<VolunteeringModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VolunteeringModel {
  String? title;
  String? link;
  String? text;
  String? image;

  VolunteeringModel({this.title, this.link, this.text, this.image});

  VolunteeringModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['link'] = link;
    data['text'] = text;
    data['image'] = image;
    return data;
  }
}