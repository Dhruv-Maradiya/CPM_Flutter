// To parse this JSON data, do
//
//     final frontendTechnologies = frontendTechnologiesFromJson(jsonString);

import 'dart:convert';

FrontendTechnologies frontendTechnologiesFromJson(String str) =>
    FrontendTechnologies.fromJson(json.decode(str));

String frontendTechnologiesToJson(FrontendTechnologies data) =>
    json.encode(data.toJson());

class FrontendTechnologies {
  FrontendTechnologies({
    required this.data,
  });

  final Data data;

  factory FrontendTechnologies.fromJson(Map<String, dynamic> json) =>
      FrontendTechnologies(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.frontendTechnologies,
    required this.count,
  });

  final List<FrontendTechnology> frontendTechnologies;
  final int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        frontendTechnologies: List<FrontendTechnology>.from(
            json["frontendTechnologies"]
                .map((x) => FrontendTechnology.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "frontendTechnologies":
            List<dynamic>.from(frontendTechnologies.map((x) => x.toJson())),
        "count": count,
      };
}

class FrontendTechnology {
  FrontendTechnology({
    required this.id,
    required this.name,
    required this.logo,
    required this.url,
  });

  final int id;
  final String name;
  final String logo;
  final String url;

  factory FrontendTechnology.fromJson(Map<String, dynamic> json) =>
      FrontendTechnology(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "url": url,
      };
}
