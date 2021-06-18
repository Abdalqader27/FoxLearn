// To parse this JSON data, do
//
//     final subjects = subjectsFromJson(jsonString);

import 'dart:convert';

List<SubjectsModel> subjectsFromJson(String str) =>
    List<SubjectsModel>.from(json.decode(str).map((x) => SubjectsModel.fromJson(x)));

String subjectsToJson(List<SubjectsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectsModel {
  SubjectsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.filesCount,
    required this.questionCount,
    required this.serviceCount,
    required this.url,
  });

  int id;
  String name;
  String description;
  int filesCount;
  int questionCount;
  int serviceCount;
  String url;

  factory SubjectsModel.fromJson(Map<String, dynamic> json) => SubjectsModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        filesCount: json["filesCount"],
        questionCount: json["questionCount"],
        serviceCount: json["serviceCount"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "filesCount": filesCount,
        "questionCount": questionCount,
        "serviceCount": serviceCount,
        "url": url,
      };
}
