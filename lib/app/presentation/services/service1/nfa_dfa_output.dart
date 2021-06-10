// To parse this JSON data, do
//
//     final nfaDfaModel = nfaDfaModelFromJson(jsonString);

import 'dart:convert';

NfaDfaModel nfaDfaModelFromJson(String str) => NfaDfaModel.fromJson(json.decode(str));

String nfaDfaModelToJson(NfaDfaModel data) => json.encode(data.toJson());

class NfaDfaModel {
  NfaDfaModel({
required    this.stepOne,
    required this.stepTwo,
  });

  StepOne stepOne;
  StepTwo stepTwo;

  factory NfaDfaModel.fromJson(Map<String, dynamic> json) => NfaDfaModel(
    stepOne: StepOne.fromJson(json["stepOne"]),
    stepTwo: StepTwo.fromJson(json["stepTwo"]),
  );

  Map<String, dynamic> toJson() => {
    "stepOne": stepOne.toJson(),
    "stepTwo": stepTwo.toJson(),
  };
}

class StepOne {
  StepOne({
    required   this.p,
    required   this.segma,
    required this.delta,
    required this.start,
    required  this.end,
  });

  List<List<String>> p;
  List<String> segma;
  List<StepOneDelta> delta;
  String start;
  List<List<String>> end;

  factory StepOne.fromJson(Map<String, dynamic> json) => StepOne(
    p: List<List<String>>.from(json["p"].map((x) => List<String>.from(x.map((x) => x)))),
    segma: List<String>.from(json["segma"].map((x) => x)),
    delta: List<StepOneDelta>.from(json["delta"].map((x) => StepOneDelta.fromJson(x))),
    start: json["start"],
    end: List<List<String>>.from(json["end"].map((x) => List<String>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "p": List<dynamic>.from(p.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "segma": List<dynamic>.from(segma.map((x) => x)),
    "delta": List<dynamic>.from(delta.map((x) => x.toJson())),
    "start": start,
    "end": List<dynamic>.from(end.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}

class StepOneDelta {
  StepOneDelta({
    required   this.first,
    required  this.second,
  });

  List<String> first;
  List<List<String>> second;

  factory StepOneDelta.fromJson(Map<String, dynamic> json) => StepOneDelta(
    first: List<String>.from(json["first"].map((x) => x)),
    second: List<List<String>>.from(json["second"].map((x) => List<String>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "first": List<dynamic>.from(first.map((x) => x)),
    "second": List<dynamic>.from(second.map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}

class StepTwo {
  StepTwo({
    required   this.p,
    required   this.segma,
    required    this.delta,
    required   this.start,
    required   this.end,
  });

  List<String> p;
  List<String> segma;
  List<StepTwoDelta> delta;
  String start;
  List<String> end;

  factory StepTwo.fromJson(Map<String, dynamic> json) => StepTwo(
    p: List<String>.from(json["p"].map((x) => x)),
    segma: List<String>.from(json["segma"].map((x) => x)),
    delta: List<StepTwoDelta>.from(json["delta"].map((x) => StepTwoDelta.fromJson(x))),
    start: json["start"],
    end: List<String>.from(json["end"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "p": List<dynamic>.from(p.map((x) => x)),
    "segma": List<dynamic>.from(segma.map((x) => x)),
    "delta": List<dynamic>.from(delta.map((x) => x.toJson())),
    "start": start,
    "end": List<dynamic>.from(end.map((x) => x)),
  };
}

class StepTwoDelta {
  StepTwoDelta({
    required    this.first,
    required this.second,
  });

  String first;
  List<String> second;

  factory StepTwoDelta.fromJson(Map<String, dynamic> json) => StepTwoDelta(
    first: json["first"],
    second: List<String>.from(json["second"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "second": List<dynamic>.from(second.map((x) => x)),
  };
}
