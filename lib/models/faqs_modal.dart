import 'dart:convert';

List<FaqSModal> welcomeFromJson(String str) => List<FaqSModal>.from(json.decode(str).map((x) => FaqSModal.fromJson(x)));

String welcomeToJson(List<FaqSModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FaqSModal {
  String question;
  String answer;

  FaqSModal({
    required this.question,
    required this.answer,
  });

  factory FaqSModal.fromJson(Map<String, dynamic> json) => FaqSModal(
    question: json["question"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answer": answer,
  };
}
