// To parse this JSON data, do
//
//     final regToDfaOut = regToDfaOutFromJson(jsonString);

import 'dart:convert';

RegToDfaOut regToDfaOutFromJson(String str) =>
    RegToDfaOut.fromJson(json.decode(str));

String regToDfaOutToJson(RegToDfaOut data) => json.encode(data.toJson());

class RegToDfaOut {
  RegToDfaOut({
    required this.stepOne,
    required this.stepTwo,
  });

  List<List<String>> stepOne;
  List<List<String>> stepTwo;

  factory RegToDfaOut.fromJson(Map<String, dynamic> json) => RegToDfaOut(
        stepOne: List<List<String>>.from(
            json["stepOne"].map((x) => List<String>.from(x.map((x) => x)))),
        stepTwo: List<List<String>>.from(
            json["stepTwo"].map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "stepOne": List<dynamic>.from(
            stepOne.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "stepTwo": List<dynamic>.from(
            stepTwo.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
