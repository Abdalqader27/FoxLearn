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
    required this.question,
    required this.options,
    required this.answerIndex,
  });

  int id;
  String question;
  List<String> options;
  int answerIndex;

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        id: json["id"],
        question: json["question"],
        options: List<String>.from(json["options"].map((x) => x)),
        answerIndex: json["answerIndex"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "options": List<dynamic>.from(options.map((x) => x)),
        "answerIndex": answerIndex,
      };
}
