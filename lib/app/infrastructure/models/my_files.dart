// To parse this JSON data, do
//
//     final myFiles = myFilesFromJson(jsonString);

import 'dart:convert';

List<MyFiles> myFilesFromJson(String str) =>
    List<MyFiles>.from(json.decode(str).map((x) => MyFiles.fromJson(x)));

String myFilesToJson(List<MyFiles> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyFiles {
  MyFiles({
    required this.className,
    required this.objectId,
    required this.createdAt,
    required this.updatedAt,
    required this.fileName,
    required this.myFile,
    required this.universityId,
    required this.isActivited,
  });

  String className;
  String objectId;
  DateTime createdAt;
  DateTime updatedAt;
  String fileName;
  MyFile myFile;
  int universityId;
  bool isActivited;

  MyFiles copyWith({
    required  String className,
    required  String objectId,
    required  DateTime createdAt,
    required  DateTime updatedAt,
    required String fileName,
    required MyFile myFile,
    required int universityId,
    required bool isActivited,
  }) =>
      MyFiles(
        className: className,
        objectId: objectId,
        createdAt: createdAt,
        updatedAt: updatedAt,
        fileName: fileName,
        myFile: myFile,
        universityId: universityId,
        // ignore: dead_null_aware_expression
        isActivited:  this.isActivited,
      );

  factory MyFiles.fromJson(Map<String, dynamic> json) => MyFiles(
        className: json["className"],
        objectId: json["objectId"],
        createdAt:  DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        fileName:json["FileName"],
        myFile:  MyFile.fromJson(json["MyFile"]),
        universityId: json["UniversityID"],
        isActivited: json["IsActivited"],
      );

  Map<String, dynamic> toJson() => {
        "className":  className,
        "objectId": objectId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "FileName": fileName,
        "MyFile": myFile.toJson(),
        "UniversityID": universityId,
        "IsActivited":isActivited,
      };
}

class MyFile {
  MyFile({
    required this.type,
    required this.name,
    required this.url,
  });

  String type;
  String name;
  String url;

  MyFile copyWith({
    required String type,
    required String name,
    required String url,
  }) =>
      MyFile(
        type: type,
        name: name,
        url: url,
      );

  factory MyFile.fromJson(Map<String, dynamic> json) => MyFile(
        type:  json["__type"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "__type": type,
        "name": name,
        "url": url,
      };
}
