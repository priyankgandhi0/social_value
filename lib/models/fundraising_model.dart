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

class Alphabet {
  int id;
  String name;

  Alphabet({required this.id, required this.name});
}

List<Alphabet> listAlphabet = [
  Alphabet(id: 1, name: 'a'),
  Alphabet(id: 2, name: 'b'),
  Alphabet(id: 3, name: 'c'),
  Alphabet(id: 4, name: 'd'),
  Alphabet(id: 5, name: 'e'),
  Alphabet(id: 6, name: 'f'),
  Alphabet(id: 7, name: 'g'),
  Alphabet(id: 8, name: 'h'),
  Alphabet(id: 9, name: 'i'),
  Alphabet(id: 10, name: 'j'),
  Alphabet(id: 11, name: 'k'),
  Alphabet(id: 12, name: 'l'),
  Alphabet(id: 13, name: 'm'),
  Alphabet(id: 14, name: 'n'),
  Alphabet(id: 15, name: 'o'),
  Alphabet(id: 16, name: 'p'),
  Alphabet(id: 17, name: 'q'),
  Alphabet(id: 18, name: 'r'),
  Alphabet(id: 19, name: 's'),
  Alphabet(id: 20, name: 't'),
  Alphabet(id: 21, name: 'u'),
  Alphabet(id: 22, name: 'v'),
  Alphabet(id: 23, name: 'w'),
  Alphabet(id: 24, name: 'x'),
  Alphabet(id: 25, name: 'y'),
  Alphabet(id: 26, name: 'z'),
];
