// To parse this JSON data, do
//
//     final facultyProfileModel = facultyProfileModelFromJson(jsonString);

import 'dart:convert';

import 'package:projectify/rest/rest_constants.dart';

FacultyProfileModel facultyProfileModelFromJson(String str) =>
    FacultyProfileModel.fromJson(json.decode(str));

String facultyProfileModelToJson(FacultyProfileModel data) =>
    json.encode(data.toJson());

class FacultyProfileModel {
  FacultyProfileModel({
    required this.data,
  });

  Data data;

  factory FacultyProfileModel.fromJson(Map<String, dynamic> json) =>
      FacultyProfileModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    this.createdBy,
    required this.facultyRoles,
    required this.email,
    required this.employeeId,
    required this.number,
    required this.profilePicture,
    required this.url,
  });

  int id;
  String name;
  dynamic createdBy;
  FacultyRoles facultyRoles;
  String email;
  String employeeId;
  String number;
  String profilePicture;
  String url;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        createdBy: json["createdBy"],
        facultyRoles: FacultyRoles.fromJson(json["facultyRoles"]),
        email: json["email"],
        employeeId: json["employeeId"],
        number: json["number"],
        profilePicture: json["profilePicture"] ?? '',
        url: json["profilePicture"] != null
            ? "${RestConstants.public}/images/${json['profilePicture']}"
            : "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createdBy": createdBy,
        "facultyRoles": facultyRoles.toJson(),
        "email": email,
        "employeeId": employeeId,
        "number": number,
        "profilePicture": profilePicture,
        "url": url,
      };
}

class FacultyRoles {
  FacultyRoles({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory FacultyRoles.fromJson(Map<String, dynamic> json) => FacultyRoles(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
