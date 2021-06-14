// To parse this JSON data, do
//
//     final filesModel = filesModelFromJson(jsonString);

import 'dart:convert';

List<FilesModel> filesModelFromJson(String str) =>
    List<FilesModel>.from(json.decode(str).map((x) => FilesModel.fromJson(x)));

String filesModelToJson(List<FilesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FilesModel {
  FilesModel({
    required this.id,
    required this.fileName,
    required this.subjectId,
    required this.url,
  });

  int id;
  String fileName;
  int subjectId;
  String url;

  factory FilesModel.fromJson(Map<String, dynamic> json) => FilesModel(
        id: json["id"],
        fileName: json["fileName"],
        subjectId: json["subjectId"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": fileName,
        "subjectId": subjectId,
        "url": url,
      };
}
