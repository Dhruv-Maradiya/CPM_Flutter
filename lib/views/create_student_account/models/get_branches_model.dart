import 'dart:convert';

GetBranchesModel getBranchesFromJson(String str) =>
    GetBranchesModel.fromJson(json.decode(str));

String getBranchesToJson(GetBranchesModel data) => json.encode(data.toJson());

class GetBranchesModel {
  GetBranchesModel({
    required this.data,
  });

  List<Data> data;

  factory GetBranchesModel.fromJson(Map<String, dynamic> json) =>
      GetBranchesModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
