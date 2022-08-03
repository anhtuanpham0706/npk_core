// To parse this JSON data, do
//
//     final npkResult = npkResultFromJson(jsonString);

import 'dart:convert';

NpkResult npkResultFromJson(String str) => NpkResult.fromJson(json.decode(str));

String npkResultToJson(NpkResult data) => json.encode(data.toJson());

class NpkResult {
  NpkResult({
    required this.weight,
    required this.rate,
    required this.manures,
    required this.mix,
    required this.total,
  });

  String weight;
  String rate;
  List<Manure> manures;
  double mix;
  double total;

  factory NpkResult.fromJson(Map<String, dynamic> json) => NpkResult(
    weight: json["weight"],
    rate: json["rate"],
    manures: List<Manure>.from(json["manures"].map((x) => Manure.fromJson(x))),
    mix: json["mix"].toDouble(),
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "weight": weight,
    "rate": rate,
    "manures": List<dynamic>.from(manures.map((x) => x.toJson())),
    "mix": mix,
    "total": total,
  };
}

class Manure {
  Manure({
    required this.code,
    required this.name,
    required this.value,
  });

  String code;
  String name;
  double value;

  factory Manure.fromJson(Map<String, dynamic> json) => Manure(
    code: json["code"],
    name: json["name"],
    value: json["value"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "value": value,
  };
}
