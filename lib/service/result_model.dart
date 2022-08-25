// To parse this JSON data, do
//
//     final npkResult = npkResultFromJson(jsonString);

import 'dart:convert';

NpkResult npkResultFromJson(String str) => NpkResult.fromJson(json.decode(str));

String npkResultToJson(NpkResult data) => json.encode(data.toJson());

class NpkResult {
  NpkResult({
    this.weight = '',
    this.rate = '',
    this.mix = 0.0,
    this.total = 0.0,
    required this.manures
  });

  String weight;
  String rate;
  late List<Manure> manures;
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
     this.code = '',
     this.name = '',
     this.value = 0.0,
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
