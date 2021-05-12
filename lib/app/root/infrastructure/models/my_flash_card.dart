// To parse this JSON data, do
//
//     final myflashCard = myflashCardFromJson(jsonString);

import 'dart:convert';

List<MyFlashCard> myFlashCardFromJson(String str) =>
    List<MyFlashCard>.from(json.decode(str).map((x) => MyFlashCard.fromJson(x)));

String myFlashCardToJson(List<MyFlashCard> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyFlashCard {
  MyFlashCard({
    required this.subjectId,
    required this.subjectName,
    required this.classId,
    required this.cardsList,
  });

  int subjectId;
  String subjectName;
  int classId;
  List<CardsList> cardsList;

  MyFlashCard copyWith({
    required int subjectId,
    required String subjectName,
    required int classId,
    required List<CardsList> cardsList,
  }) =>
      MyFlashCard(
        subjectId: subjectId,
        subjectName: subjectName,
        classId: classId,
        cardsList: cardsList,
      );

  factory MyFlashCard.fromJson(Map<String, dynamic> json) => MyFlashCard(
        subjectId: json["subjectId"] == null ? null : json["subjectId"],
        subjectName: json["subjectName"] == null ? null : json["subjectName"],
        classId: json["classId"] == null ? null : json["classId"],
        cardsList: List<CardsList>.from(json["cardsList"].map((x) => CardsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subjectId": subjectId,
        "subjectName": subjectName,
        "classId": classId,
        "cardsList": List<dynamic>.from(cardsList.map((x) => x.toJson())),
      };
}

class CardsList {
  CardsList({
    required this.id,
    required this.title,
    required this.description,
    required this.classSubjectId,
    required this.classSubject,
  });

  int id;
  String title;
  String description;
  int classSubjectId;
  String classSubject;

  CardsList copyWith({
    required int id,
    required String title,
    required String description,
    required int classSubjectId,
    required String classSubject,
  }) =>
      CardsList(
        id: id,
        title: title,
        description: description,
        classSubjectId: classSubjectId,
        // ignore: dead_null_aware_expression
        classSubject: classSubject ?? this.classSubject,
      );

  factory CardsList.fromJson(Map<String, dynamic> json) => CardsList(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        classSubjectId: json["classSubjectId"] == null ? null : json["classSubjectId"],
        classSubject: json["classSubject"] == null ? null : json["classSubject"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "classSubjectId": classSubjectId,
        "classSubject": classSubject,
      };
}
