// To parse this JSON data, do
//
//     final questionBankModule = questionBankModuleFromJson(jsonString);

import 'dart:convert';

List<QuestionBankModule> questionBankModuleFromJson(String str) => List<QuestionBankModule>.from(json.decode(str).map((x) => QuestionBankModule.fromJson(x)));

String questionBankModuleToJson(List<QuestionBankModule> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionBankModule {
  QuestionBankModule({
    required this.classSubjectId,
    required this.classSubjectName,
    required this.subjectExamsList,
  });

  int classSubjectId;
  String classSubjectName;
  List<SubjectExamsList> subjectExamsList;

  QuestionBankModule copyWith({
    required int classSubjectId,
    required String classSubjectName,
    required List<SubjectExamsList> subjectExamsList,
  }) =>
      QuestionBankModule(
        classSubjectId: classSubjectId,
        classSubjectName: classSubjectName,
        subjectExamsList: subjectExamsList,
      );

  factory QuestionBankModule.fromJson(Map<String, dynamic> json) => QuestionBankModule(
    classSubjectId: json["classSubjectId"],
    classSubjectName: json["classSubjectName"],
    subjectExamsList:  List<SubjectExamsList>.from(json["subjectExamsList"].map((x) => SubjectExamsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classSubjectId": classSubjectId,
    "classSubjectName": classSubjectName,
    "subjectExamsList": List<dynamic>.from(subjectExamsList.map((x) => x.toJson())),
  };
}

class SubjectExamsList {
  SubjectExamsList({
    required this.subjectExamId,
    required this.subjectExamName,
    required this.isActivated,
    required this.examQuestionsList,
  });

  int subjectExamId;
  String subjectExamName;
  bool isActivated;
  List<ExamQuestionsList> examQuestionsList;

  SubjectExamsList copyWith({
    required int subjectExamId,
    required String subjectExamName,
    required bool isActivated,
    required List<ExamQuestionsList> examQuestionsList,
  }) =>
      SubjectExamsList(
        subjectExamId: subjectExamId,
        subjectExamName: subjectExamName,
        isActivated: isActivated ,
        examQuestionsList: examQuestionsList ,
      );

  factory SubjectExamsList.fromJson(Map<String, dynamic> json) => SubjectExamsList(
    subjectExamId:json["subjectExamId"],
    subjectExamName: json["subjectExamName"],
    isActivated:json["isActivated"],
    examQuestionsList: List<ExamQuestionsList>.from(json["examQuestionsList"].map((x) => ExamQuestionsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subjectExamId": subjectExamId,
    "subjectExamName":  subjectExamName,
    "isActivated": isActivated,
    "examQuestionsList":  List<dynamic>.from(examQuestionsList.map((x) => x.toJson())),
  };
}

class ExamQuestionsList {
  ExamQuestionsList({
    required this.id,
    required this.question,
    required this.option1,
    required  this.option2,
    required    this.option3,
    required  this.option4,
    required this.option5,
    required  this.correctAnswer,
    required  this.classSubjectExamYearId,
    this.classSubjectExamYear,
    this.classSubjectExamYearName,
  });

  int id;
  String question;
  String option1;
  String option2;
  String option3;
  String option4;
  String option5;
  String correctAnswer;
  int classSubjectExamYearId;
  dynamic classSubjectExamYear;
  dynamic classSubjectExamYearName;

  ExamQuestionsList copyWith({
    required  int id,
    required  String question,
    required  String option1,
    required  String option2,
    required String option3,
    required String option4,
    required String option5,
    required String correctAnswer,
    required int classSubjectExamYearId,
    dynamic classSubjectExamYear,
    dynamic classSubjectExamYearName,
  }) =>
      ExamQuestionsList(
        id: id,
        question: question,
        option1: option1 ,
        option2: option2 ,
        option3: option3 ,
        option4: option4 ,
        option5: option5 ,
        correctAnswer: correctAnswer,
        classSubjectExamYearId: classSubjectExamYearId,
        classSubjectExamYear: classSubjectExamYear ?? this.classSubjectExamYear,
        classSubjectExamYearName: classSubjectExamYearName ?? this.classSubjectExamYearName,
      );

  factory ExamQuestionsList.fromJson(Map<String, dynamic> json) => ExamQuestionsList(
    id:  json["id"],
    question: json["question"],
    option1:  json["option1"],
    option2: json["option2"],
    option3:json["option3"],
    option4: json["option4"],
    option5:  json["option5"],
    correctAnswer: json["correctAnswer"],
    classSubjectExamYearId: json["classSubjectExamYearId"],
    classSubjectExamYear: json["classSubjectExamYear"],
    classSubjectExamYearName: json["classSubjectExamYearName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    // ignore: unnecessary_null_comparison
    "question":  question,
    "option1": option1,
    "option2": option2,
    "option3": option3,
    "option4": option4,
    "option5":  option5,
    "correctAnswer": correctAnswer,
    "classSubjectExamYearId":classSubjectExamYearId,
    "classSubjectExamYear": classSubjectExamYear,
    "classSubjectExamYearName": classSubjectExamYearName,
  };
}
