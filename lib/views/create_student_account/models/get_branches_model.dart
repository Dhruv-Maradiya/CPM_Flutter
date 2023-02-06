// To parse this JSON data, do
//
//     final getBranches = getBranchesFromJson(jsonString);

import 'dart:convert';

GetBranchesModel getBranchesFromJson(String str) =>
    GetBranchesModel.fromJson(json.decode(str));

String getBranchesToJson(GetBranchesModel data) => json.encode(data.toJson());

class GetBranchesModel {
  GetBranchesModel({
    required this.data,
  });

  List<Datum> data;

  factory GetBranchesModel.fromJson(Map<String, dynamic> json) =>
      GetBranchesModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.displayName,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String displayName;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        displayName: json["displayName"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "displayName": displayName,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
