// To parse this JSON data, do
//
//     final getBranchesModel = getBranchesModelFromJson(jsonString);

import 'dart:convert';

GetBranchesModel getBranchesModelFromJson(String str) =>
    GetBranchesModel.fromJson(json.decode(str));

String getBranchesModelToJson(GetBranchesModel data) =>
    json.encode(data.toJson());

class GetBranchesModel {
  GetBranchesModel({
    required this.data,
  });

  Data data;

  factory GetBranchesModel.fromJson(Map<String, dynamic> json) =>
      GetBranchesModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.branches,
    required this.count,
  });

  List<Branch> branches;
  int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        branches:
            List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "branches": List<dynamic>.from(branches.map((x) => x.toJson())),
        "count": count,
      };
}

class Branch {
  Branch({
    required this.id,
    required this.name,
    required this.displayName,
  });

  int id;
  String name;
  String displayName;

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"],
        displayName: json["displayName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "displayName": displayName,
      };
}
