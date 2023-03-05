// To parse this JSON data, do
//
//     final databaseTechnologies = databaseTechnologiesFromJson(jsonString);

import 'dart:convert';

DatabaseTechnologies databaseTechnologiesFromJson(String str) =>
    DatabaseTechnologies.fromJson(json.decode(str));

String databaseTechnologiesToJson(DatabaseTechnologies data) =>
    json.encode(data.toJson());

class DatabaseTechnologies {
  DatabaseTechnologies({
    required this.data,
  });

  final Data data;

  factory DatabaseTechnologies.fromJson(Map<String, dynamic> json) =>
      DatabaseTechnologies(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.databaseTechnologies,
    required this.count,
  });

  final List<DatabaseTechnology> databaseTechnologies;
  final int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        databaseTechnologies: List<DatabaseTechnology>.from(
            json["databaseTechnologies"]
                .map((x) => DatabaseTechnology.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "databaseTechnologies":
            List<dynamic>.from(databaseTechnologies.map((x) => x.toJson())),
        "count": count,
      };
}

class DatabaseTechnology {
  DatabaseTechnology({
    required this.id,
    required this.name,
    required this.url,
  });

  final int id;
  final String name;
  final String url;

  factory DatabaseTechnology.fromJson(Map<String, dynamic> json) =>
      DatabaseTechnology(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}
