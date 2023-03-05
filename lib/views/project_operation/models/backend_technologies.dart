// To parse this JSON data, do
//
//     final backendTechnologies = backendTechnologiesFromJson(jsonString);

import 'dart:convert';

BackendTechnologies backendTechnologiesFromJson(String str) =>
    BackendTechnologies.fromJson(json.decode(str));

String backendTechnologiesToJson(BackendTechnologies data) =>
    json.encode(data.toJson());

class BackendTechnologies {
  BackendTechnologies({
    required this.data,
  });

  final Data data;

  factory BackendTechnologies.fromJson(Map<String, dynamic> json) =>
      BackendTechnologies(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.backendTechnologies,
    required this.count,
  });

  final List<BackendTechnology> backendTechnologies;
  final int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        backendTechnologies: List<BackendTechnology>.from(
            json["backendTechnologies"]
                .map((x) => BackendTechnology.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "backendTechnologies":
            List<dynamic>.from(backendTechnologies.map((x) => x.toJson())),
        "count": count,
      };
}

class BackendTechnology {
  BackendTechnology({
    required this.id,
    required this.name,
    required this.logo,
    required this.description,
    required this.url,
  });

  final int id;
  final String name;
  final String logo;
  final String description;
  final String url;

  factory BackendTechnology.fromJson(Map<String, dynamic> json) =>
      BackendTechnology(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        description: json["description"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "description": description,
        "url": url,
      };
}
