// To parse this JSON data, do
//
//     final awarnessModal = awarnessModalFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

List<AwarenessModal> awarenessModalFromJson(String str) => List<AwarenessModal>.from(json.decode(str).map((x) => AwarenessModal.fromJson(x)));

String awarenessModalToJson(List<AwarenessModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AwarenessModal {
  String title;
  DateTime start;
  bool allDay;
  String url;

  String get monthString => "${start.month}-${start.year}";
  String get dayString => "${start.day}";

  AwarenessModal({
    required this.title,
    required this.start,
    required this.allDay,
    required this.url,
  });

  factory AwarenessModal.fromJson(Map<String, dynamic> json) => AwarenessModal(
        title: json["title"],
        start: DateTime.parse(json["start"]),
        allDay: json["allDay"],
        url: json["url"],
  );

  Map<String, dynamic> toJson() => {
        "title": title,
        "start": "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
        "allDay": allDay,
        "url": url,
      };
}

class AwarenessDataModal {
  DateTime awarenessMonth;
  List<AwarenessDayDataModal> awarenessData;
  List<AwarenessModal> monthData;
  String get monthString => "${awarenessMonth.month}-${awarenessMonth.year}";
  String get dayString => "${awarenessMonth.day}";
  String get tittleString => DateFormat('MMMM yyyy').format(awarenessMonth);
  AwarenessDataModal({
    required this.awarenessMonth,
    required this.monthData,
    required this.awarenessData,
  });
}


class AwarenessDayDataModal {
  DateTime awarenessDay;
  List<AwarenessModal> awarenessData;
  String get dayString => "${awarenessDay.day}";

  AwarenessDayDataModal({
    required this.awarenessDay,
    required this.awarenessData,
  });
}
