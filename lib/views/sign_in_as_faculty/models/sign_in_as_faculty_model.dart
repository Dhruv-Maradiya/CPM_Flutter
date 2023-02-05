// To parse this JSON data, do
//
//     final studentLoginModel = studentLoginModelFromJson(jsonString);

import 'dart:convert';

FacultySignInModel studentLoginModelFromJson(String str) =>
    FacultySignInModel.fromJson(json.decode(str));

String studentLoginModelToJson(FacultySignInModel data) =>
    json.encode(data.toJson());

class FacultySignInModel {
  FacultySignInModel({
    required this.data,
  });

  Data data;

  factory FacultySignInModel.fromJson(Map<String, dynamic> json) =>
      FacultySignInModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.token,
  });

  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
