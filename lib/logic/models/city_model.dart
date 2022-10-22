import 'dart:convert';

List<CityName> cityNameFromJson(String str) => List<CityName>.from(json.decode(str).map((x) => CityName.fromJson(x)));

String cityNameToJson(List<CityName> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityName {
  CityName({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory CityName.fromJson(Map<String, dynamic> json) => CityName(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}