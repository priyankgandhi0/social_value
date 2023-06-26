
import 'dart:convert';

List<GetAffirmationModal> getAffirmation(String str) => List<GetAffirmationModal>.from(json.decode(str).map((x) => GetAffirmationModal.fromJson(x)));


class GetAffirmationModal {
  GetAffirmationModal({
    required this.id,
    required this.text,
  });

  final String? id;
  final String? text;

  GetAffirmationModal copyWith({
    String? id,
    String? text,
  }) {
    return GetAffirmationModal(
      id: id ?? this.id,
      text: text ?? this.text,
    );
  }

  factory GetAffirmationModal.fromJson(Map<String, dynamic> json){
    return GetAffirmationModal(
      id: json["id"],
      text: json["text"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "text": text,
  };

}
