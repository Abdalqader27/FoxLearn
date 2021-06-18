// To parse this JSON data, do
//
//     final posLocMoel = posLocMoelFromJson(jsonString);

import 'dart:convert';

List<PosLocModel> posLocMoelFromJson(String str) =>
    List<PosLocModel>.from(json.decode(str).map((x) => PosLocModel.fromJson(x)));

String posLocMoelToJson(List<PosLocModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PosLocModel {
  PosLocModel({
    required this.id,
    required this.name,
    required this.lag,
    required this.lat,
  });

  dynamic id;
  dynamic name;
  dynamic lag;
  dynamic lat;

  factory PosLocModel.fromJson(Map<String, dynamic> json) => PosLocModel(
        id: json["id"],
        name: json["name"],
        lag: json["lag"],
        lat: json["lat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lag": lag,
        "lat": lat,
      };
}
