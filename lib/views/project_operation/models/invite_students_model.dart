// To parse this JSON data, do
//
//     final inviteStudentsModel = inviteStudentsModelFromJson(jsonString);

import 'dart:convert';

import 'package:projectify/views/home/models/home_screen_model.dart';

InviteStudentsModel inviteStudentsModelFromJson(String str) =>
    InviteStudentsModel.fromJson(json.decode(str));

String inviteStudentsModelToJson(InviteStudentsModel data) =>
    json.encode(data.toJson());

class InviteStudentsModel {
  InviteStudentsModel({
    required this.data,
  });

  final Data data;

  factory InviteStudentsModel.fromJson(Map<String, dynamic> json) =>
      InviteStudentsModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.students,
    required this.count,
  });

  final List<Student> students;
  final int count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        students: List<Student>.from(
            json["students"].map((x) => Student.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "students": List<dynamic>.from(students.map((x) => x.toJson())),
        "count": count,
      };
}
