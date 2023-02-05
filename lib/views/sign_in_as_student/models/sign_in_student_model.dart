// To parse this JSON data, do
//
//     final studentLoginModel = studentLoginModelFromJson(jsonString);

import 'dart:convert';

StudentSignInModel studentLoginModelFromJson(String str) =>
    StudentSignInModel.fromJson(json.decode(str));

String studentLoginModelToJson(StudentSignInModel data) =>
    json.encode(data.toJson());

class StudentSignInModel {
  StudentSignInModel({
    required this.data,
  });

  Data data;

  factory StudentSignInModel.fromJson(Map<String, dynamic> json) =>
      StudentSignInModel(
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
