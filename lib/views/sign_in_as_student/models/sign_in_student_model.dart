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
    required this.userId,
  });

  String token;
  int userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "userId": userId,
      };
}
