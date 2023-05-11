import 'dart:convert';

List<GamesList> gamesListFromJson(String str) =>
    List<GamesList>.from(json.decode(str).map((x) => GamesList.fromJson(x)));

String gamesListToJson(List<GamesList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GamesList {
  String id;
  String title;
  String image;
  String embedUrl;

  GamesList({
    required this.id,
    required this.title,
    required this.image,
    required this.embedUrl,
  });

  factory GamesList.fromJson(Map<String, dynamic> json) => GamesList(
        id: json["id"] ?? "",
        title: json["title"] ?? "",
        image: json["image"] ?? "",
        embedUrl: json["embedURL"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "embedURL": embedUrl,
      };
}
