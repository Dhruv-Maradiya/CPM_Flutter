// To parse this JSON data, do
//
//     final studentProfileModel = studentProfileModelFromJson(jsonString);

import 'dart:convert';

import 'package:projectify/rest/rest_constants.dart';

StudentProfileModel studentProfileModelFromJson(String str) =>
    StudentProfileModel.fromJson(json.decode(str));

String studentProfileModelToJson(StudentProfileModel data) =>
    json.encode(data.toJson());

class StudentProfileModel {
  StudentProfileModel({
    required this.data,
  });

  Data data;

  factory StudentProfileModel.fromJson(Map<String, dynamic> json) =>
      StudentProfileModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.enrollmentNo,
    required this.profilePicture,
    required this.name,
    required this.email,
    required this.branch,
    required this.number,
    required this.semester,
    required this.url,
  });

  int id;
  String enrollmentNo;
  String profilePicture;
  String name;
  String email;
  Branch branch;
  String number;
  int semester;
  String url;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        enrollmentNo: json["enrollmentNo"],
        profilePicture: json["profilePicture"] ?? "",
        name: json["name"],
        email: json["email"],
        branch: Branch.fromJson(json["branch"]),
        number: json["number"],
        semester: json["semester"],
        url: json["profilePicture"] != null
            ? "${RestConstants.public}/images/${json['profilePicture']}"
            : "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "enrollmentNo": enrollmentNo,
        "profilePicture": profilePicture,
        "name": name,
        "email": email,
        "branch": branch.toJson(),
        "number": number,
        "semester": semester,
        "url": url,
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
