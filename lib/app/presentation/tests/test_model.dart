// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'dart:convert';

List<TestModel> testModelFromJson(String str) =>
    List<TestModel>.from(json.decode(str).map((x) => TestModel.fromJson(x)));

String testModelToJson(List<TestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestModel {
  TestModel({
    required this.id,
    required this.subjectId,
    required this.question,
    required this.answers,
  });

  int id;
  int subjectId;
  String question;
  List<Answer> answers;

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        id: json["id"],
        subjectId: json["subjectId"],
        question: json["question"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subjectId": subjectId,
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    required this.id,
    required this.answer,
    required this.isTrue,
  });

  int id;
  String answer;
  bool isTrue;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["id"],
        answer: json["answer"],
        isTrue: json["isTrue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "answer": answer,
        "isTrue": isTrue,
      };
}
