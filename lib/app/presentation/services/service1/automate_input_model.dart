// To parse this JSON data, do
//
//     final automateInput = automateInputFromJson(jsonString);

import 'dart:convert';

AutomateInput automateInputFromJson(String str) =>
    AutomateInput.fromJson(json.decode(str));

String automateInputToJson(AutomateInput data) => json.encode(data.toJson());

class AutomateInput {
  AutomateInput({
    required this.q,
    required this.segma,
    required this.delta,
    required this.start,
    required this.end,
  });

  List<String> q;
  List<String> segma;
  List<List<int>> delta;
  String start;
  List<String> end;

  factory AutomateInput.fromJson(Map<String, dynamic> json) => AutomateInput(
        q: List<String>.from(json["q"].map((x) => x)),
        segma: List<String>.from(json["segma"].map((x) => x)),
        delta: List<List<int>>.from(
            json["delta"].map((x) => List<int>.from(x.map((x) => x)))),
        start: json["start"],
        end: List<String>.from(json["end"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "q": List<dynamic>.from(q.map((x) => x)),
        "segma": List<dynamic>.from(segma.map((x) => x)),
        "delta": List<dynamic>.from(
            delta.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "start": start,
        "end": List<dynamic>.from(end.map((x) => x)),
      };
}
