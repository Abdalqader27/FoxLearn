// To parse this JSON data, do
//
//     final epsNfaDfa = epsNfaDfaFromJson(jsonString);

import 'dart:convert';

EpsNfaDfa epsNfaDfaFromJson(String str) => EpsNfaDfa.fromJson(json.decode(str));

String epsNfaDfaToJson(EpsNfaDfa data) => json.encode(data.toJson());

class EpsNfaDfa {
  EpsNfaDfa({
    required this.q,
    required this.segma,
    required this.delta,
    required this.start,
    required this.end,
  });

  List<String> q;
  List<String> segma;
  List<List<List<String>>> delta;
  String start;
  List<String> end;

  factory EpsNfaDfa.fromJson(Map<String, dynamic> json) => EpsNfaDfa(
        q: List<String>.from(json["q"].map((x) => x)),
        segma: List<String>.from(json["segma"].map((x) => x)),
        delta: List<List<List<String>>>.from(json["delta"].map((x) =>
            List<List<String>>.from(
                x.map((x) => List<String>.from(x.map((x) => x)))))),
        start: json["start"],
        end: List<String>.from(json["end"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "q": List<dynamic>.from(q.map((x) => x)),
        "segma": List<dynamic>.from(segma.map((x) => x)),
        "delta": List<dynamic>.from(delta.map((x) => List<dynamic>.from(
            x.map((x) => List<dynamic>.from(x.map((x) => x)))))),
        "start": start,
        "end": List<dynamic>.from(end.map((x) => x)),
      };
}
